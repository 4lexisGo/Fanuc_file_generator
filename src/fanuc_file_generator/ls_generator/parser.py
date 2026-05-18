import re

class LSFileFilter:
    """
    Traitement et filtre de fichiers LS
    """

    def __init__(self, register_number, rules_calcul=[], rules_pince=[]):
        self.register_number = register_number
        self.offset = -1
        
        self.rules_calcul = rules_calcul
        self.rules_pince = rules_pince
        
        self.last_calcul = ""
        
    def is_mouvement(self, content, mouvement_rules=("J ", "L ")):
        return content.startswith(mouvement_rules)
    
    def is_register(self, content, register_number):
        return content.startswith((f"R[{register_number}:", f"R[{register_number}]"))
    
    def is_pos_register(self, content):
        return content.startswith("PR[")

    def is_calcul_programme(self, content, liste, exception=False):
        if exception:
            if content.startswtih("CALL CALC"):
                return True
        for i in liste:
            if content == f"CALL {i}":
                return True
    
    def is_mouvement_pince(self, content, liste, exception=False):
        if exception:
            if content.startswtih("CALL TOOL"):
                return True
        for i in liste:
            if content == f"CALL {i}":
                return True

    def strip_line_number(self, line):
        """
        Garde uniquement le contenu "programme" de la ligne.
        """
        # enlève le numéro de ligne au début
        line = re.sub(r"^\s*\d+\s*:\s*", "", line)

        # enlève espaces début/fin + ';' final
        return line.strip().rstrip(";").strip()

    def search_memo(self, line, expected_index):
        """
        Vérifie si la ligne correspond à une instruction d'init de type :
        R[expected_index:...] = value
         - expected_index : numéro de registre attendu (ex : 66)
         - value : doit être un entier (ex : 1, 2, 3...)
        """
        pattern = r"R\[(\d+):.*?\]\s*=\s*([+-]?\d+)\s*;?"

        # Correspondance complète de la ligne avec le pattern
        match = re.fullmatch(pattern, line.strip())
        if not match:
            return False

        try:
            index = int(match.group(1))
            value = int(match.group(2))
        except ValueError:
            return False

        # Correspondance du numéro de registre
        if index != expected_index:
            return False
        
        return True
    
    def get_last_r_value(self, block, register_id=66):
        """
        Retourne la dernière valeur de R[register_id] dans un bloc
        """
        pattern = rf"R\[{register_id}(?::.*?)?\]\s*=\s*(.+)"
        last_value = None

        for line in block:
            match = re.search(pattern, line)
            if match:
                last_value = match.group(1).strip()

        return last_value
    
    def get_last_calcul(self, block, liste):
        """
        Trouve le dernier programme de calcul appelé
        """
        pattern = rf"CALL\s+({'|'.join(map(re.escape, liste))})"
        
        for line in block:
            match = re.search(pattern, line)
            if match:
                self.last_calcul = match.group(1).strip()
    
    def is_tool_called(self, block):
        """
        Retourne True si le bloc contient un appel
        à un outil autorisé.
        """

        pattern = r"CALL\s+(.+)"

        for line in block:
            match = re.search(pattern, line)
            if match:
                tool_name = match.group(1).strip()
                if tool_name in self.rules_pince:
                    return True

        return False
    
    def modify_speed(self, line, l_speed=100, j_speed=10):
        """
        Remplace les vitesses Fanuc :
        - mm/sec → mm_speed
        - % → j_speed
        """

        # mm/sec (L motion)
        line = re.sub(
            r"\b\d+\s*mm/sec",
            f"{l_speed}mm/sec",
            line
        )

        # % (J motion)
        line = re.sub(
            r"\b\d+\s*%",
            f"{j_speed}%",
            line
        )

        return line
 
    def modify_cnt(self, line):
        """
        Remplace les cnt Fanuc :
        - CNTxx → FINE (CNT1, CNT50, CNT100...)
        """
        line = re.sub(
            r"\bCNT\d+\b",
            "FINE",
            line
        )

        return line
    
    def modify_acc(self, line):
        """
        Remplace les accélérations Fanuc :
        - ACCxx → rien
        """
        line = re.sub(
            r"\bACC\d+\b",
            "",
            line
        )

        return line
    
    def modify_line(self, line):
        """
        Remplace tous les paramètres appelés
        """
        line = self.modify_speed(line)
        line = self.modify_cnt(line)
        #line= self.modify_acc(line)
        return line

    def mn_rule(self, content):
        """
        Règles de sélection pour la section MN
        """
        return (
            self.is_mouvement(content)
            or self.is_register(content, self.register_number)
            or self.is_pos_register(content)
            or self.is_calcul_programme(content, self.rules_calcul)
            or self.is_mouvement_pince(content, self.rules_pince)
        )

    def should_keep_mn(self, line, next_line):
        """
        Condition supplémentaire pour gardes des lignes spéciales (ex : commentaires)
        """
        content = self.strip_line_number(line)

        # cas normal
        if self.mn_rule(content):
            return True

        # cas commentaire !
        if content.startswith("!") and next_line:
            next_content = self.strip_line_number(next_line)
            if self.mn_rule(next_content):
                return True

        return False

    def keep_mn(self, input_path, rule=True):
        """
        Sélectionne les lignes de la section MN selon les règles spécifiées
        """
        with open(input_path, "r", encoding="cp1252") as f:
            input_lines = f.readlines()

        current_section = None
        
        output_lines = []

        for i, line in enumerate(input_lines):
            # Détection de la section
            if line.startswith("/"):
                current_section = line[1:].strip()
                continue
            
            stripped = self.strip_line_number(line)

            # Section MN
            if current_section == "MN":                
                if rule:
                    next_line = input_lines[i + 1] if i + 1 < len(input_lines) else None
                    # Vérification de toutes les règles pour l'ajout de la ligne
                    if self.should_keep_mn(line, next_line):

                        # Modification des paramètres de mouvements (vitesse, cnt etc...)
                        if stripped.startswith(("J ", "L ")):
                            stripped = self.modify_line(stripped)

                        # Ajout de la ligne
                        output_lines.append(stripped)

                else:
                    # Ajout de la ligne
                    output_lines.append(stripped)                      

        return output_lines
        
    def keep_pos(self, input_path):
        """
        Sélectionne les lignes de la section POS
        """
        with open(input_path, "r", encoding="cp1252") as f:
            input_lines = f.readlines()

        output_lines = []

        current_section = None

        for i, line in enumerate(input_lines):
            # Détection de la section
            if line.startswith("/"):
                current_section = line[1:].strip()
                continue

            # Section POS
            if current_section == "POS":
                output_lines.append(line.strip("\n"))

        return output_lines
        
    def extract_one_block(self, lines, start_index):
        """
        Extrait un bloc à partir d’un index
        Retourne (block, next_index)
        """

        # validation fin de bloc : doit finir par R[xx]=entier
        pattern_end = rf"R\[{self.register_number}(?::.*?)?\]\s*=\s*-?\d+\s*$"
        
        block = []
        i = start_index

        while i < len(lines):
            
            # Ignore les headers de section
            if lines[i].startswith("/"):
                i += 1
                continue

            block.append(lines[i])
            
            # Test de fin de bloc : doit se terminer par une ligne de type R[register_number]=entier
            if re.match(pattern_end, lines[i]):
                break

            i += 1

        # Test si le bloc est valide (doit se terminer par une ligne de type R[register_number]=entier)
        # Utile si on arrive à la fin du fichier sans trouver de ligne de fin de bloc valide
        if not re.match(pattern_end, block[-1]):
            return None, i + 1

        return block, i + 1

    def extract_blocks_table(self, lines):
        """
        Extrait tous les blocs du fichier et retourne une table de blocs, valeurs de registre et offsets
        """

        liste_bloc = []
        liste_valeur_registre = []
        liste_offset = []
        i = 0

        while i < len(lines):

            block, next_i = self.extract_one_block(lines, i)

            # Verification du bloc extrait
            if block is None or block == []:
                i = next_i
                continue

            # Obtention de la valeur de registre R[register_number] à la fin du bloc
            value = self.get_last_r_value(block, self.register_number)
            # Vérification de l'appel d'outil dans le bloc pour ajustement de l'offset
            if self.is_tool_called(block):
                self.offset *= -1
               
            self.get_last_calcul(block, self.rules_calcul)
            if any("PR[" in s for s in self.rules_calcul):
                block.insert(0, f"CALL {self.last_calcul}")

            # Ajout du bloc, de la valeur de registre et de l'offset à la table
            liste_bloc.append(block)
            liste_valeur_registre.append(value)
            liste_offset.append(self.offset)

            i = next_i

        return liste_bloc, liste_valeur_registre, liste_offset
    
