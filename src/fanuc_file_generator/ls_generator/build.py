import os
from datetime import datetime

class LSFileBuilder:
    """
    Gère la construction complète d'un fichier FANUC LS avec les sections /PROG, /ATTR, /APPL, /MN, /POS et /END.
    """

    def __init__(self, name, owner="",comment="", output_dir=".", stack_size=0, groupe='1,*,*,*,*', singularity='FALSE'):
        """
        Initialise le builder de fichier.

        - filename : nom du fichier sans extension
        - comment : commentaire FANUC, limites de 24 caractères. A verifier
        - output_dir : dossier de sortie
        - stack_size, groupe, singularity : paramètres FANUC
        """
        # Vérifiaction conformité du commentaire
        if len(comment) > 24:
            raise ValueError("Le commentaire ne doit pas dépasser 24 caractères.")
        
        # Création du dossier de sortie s'il n'existe pas
        os.makedirs(output_dir, exist_ok=True)

        # Construction du chemin complet du fichier
        self.filename = os.path.join(output_dir, f"{name}.LS")
        # Suppression du fichier s'il existe déjà
        if os.path.exists(self.filename):
            os.remove(self.filename)
        
        # Récupération de la date et de l'heure
        now = datetime.now()
        date_str = now.strftime("%y-%m-%d")
        time_str = now.strftime("%H:%M:%S")

        self.header = [
            f"/PROG  {name}.LS",
            f"/ATTR",
            f"OWNER	   = {owner};",
            f'COMMENT  = "{comment}";',
            f"CREATE   = DATE {date_str}  TIME {time_str};",
            f"MODIFIED = DATE {date_str}  TIME {time_str};",
            f"PROTECT  = READ_WRITE;",
            f"TCD:   STACK_SIZE	    = {stack_size},",
            f"       TASK_PRIORITY	= 50,",
            f"       TIME_SLICE     = 0,",
            f"       BUSY_LAMP_OFF	= 0,",
            f"       ABORT_REQUEST	= 0,",
            f"       PAUSE_REQUEST	= 0;",
            f"DEFAULT_GROUP	= {groupe};",
            f"/APPL",
            f"",
            f"AUTO_SINGULARITY_HEADER;"
            f"    ENABLE_SINGULARITY_AVOIDANCE   : {singularity};"
        ]

        self.mn = ["/MN"]
        self.pos = ["/POS"]
        self.footer = ["/END"]

    def add_mn_lines(self, lines):
        """
        Ajoute des lignes à la section /MN en numérotant automatiquement chaque ligne.
        """
        for line in lines:
            # Incrément de la ligne si elle ne commence pas par une instruction de mouvement
            if not line.startswith(("J ", "L ", "C ", "A ")):
                line = "  " + line
            self.mn.append(f"{len(self.mn):>4}:{line}    ;")

    def add_pos_lines(self, lines):
        """
        Ajoute des lignes à la section /POS.
        """
        self.pos.extend(lines)
        
    

    def build_file(self):
        """
        Écrit les différentes sections dans le fichier.
        """
        sections = [self.header, self.mn, self.pos, self.footer]
        
        with open(self.filename, "w", encoding="utf-8") as f:
            for section in sections:
                for line in section:
                    f.write(line + "\n")
        
class LSFileEditer:
    """
    Permet d'éditer un fichier existant en ajoutant des lignes à la section /MN.
    """

    def __init__(self, filepath):
        self.filepath = filepath
        
    def overwrite_mn_memo(self, input_lines):
        """
        Réécrit les mémos d'init autour des lignes de mouvement en fonction de leur position dans la séquence
         - Avant chaque ligne de mouvement : R[register_number] = i-0.5
         - Après chaque ligne de mouvement : R[register_number] = i
         - i : numéro de la ligne de mouvement dans la séquence (1, 2, 3...)
        """
        output_lines = []
        i = 1
                
        for line in input_lines:
            # Suppression des lignes contenant les memos d'init
            if line.startswith((f"R[{self.register_number}:", f"R[{self.register_number}]")):
                continue
            else:
                # Ajout de mémos d'init avant et après chaque ligne de mouvement
                if line.startswith(("J ", "L ")) or line.startswith(f"CALL TOOL"):
                    output_lines.append(f"R[{self.register_number}]={i-0.5}")
                    output_lines.append(line)
                    output_lines.append(f"R[{self.register_number}]={i}")
                    i += 1
                # Lignes normales
                else:
                    output_lines.append(line)
                    
        return output_lines
    
    def overwrite_mn(self, input_lines):
        """
        Réécrit la section MN du fichier de sortie avec les lignes d'entrée modifiées, en gardant les autres sections intactes.
         - input_lines : lignes à écrire dans la section MN (doivent être déjà modifiées avec les mémos d'init)
         - output_path : chemin du fichier de sortie à modifier
        """
        # Lecture du fichier
        with open(self.filepath, "r", encoding="utf-8", errors="ignore") as f:
            output_lines = f.readlines()
            
        current_section = None
        overwrited_mn = False
        
        # Ecriture
        with open(self.filepath, "w", encoding="utf-8") as f:
            for line in output_lines:
                # Détection de la section
                if line.startswith("/"):
                    current_section = line[1:].split()[0]

                # Section MN
                if current_section == "MN":
                    if not overwrited_mn:
                        f.write("/MN\n")
                        for idx, line in enumerate(input_lines, start=1):
                            f.write(f"{idx}:  {str(line).strip()} ;\n")
                        overwrited_mn = True
                    continue
                else:    
                    f.write(line)

    def overwrite_pos(self, input_lines):
            """
            Réécrit la section POS du fichier de sortie avec les lignes d'entrée modifiées, en gardant les autres sections intactes.
            - input_lines : lignes à écrire dans la section POS (doivent être déjà modifiées)
            - output_path : chemin du fichier de sortie à modifier
            """
            with open(self.filepath, "r", encoding="utf-8", errors="ignore") as f:
                output_lines = f.readlines()

            current_section = None
            overwrited_pos = False

            for line in output_lines:
                # Détection de la section
                if line.startswith("/"):
                    current_section = line[1:].split()[0]

                # Section POS
                if current_section == "POS":
                    if not overwrited_pos:
                        output_lines.extend(input_lines)
                        overwrited_pos = True
                    continue            

                # Lignes normales
                output_lines.append(line)

            # Ecriture
            with open(self.filepath, "w", encoding="utf-8") as f:
                f.writelines(output_lines)