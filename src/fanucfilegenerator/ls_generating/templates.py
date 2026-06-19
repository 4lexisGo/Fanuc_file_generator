

class MouvementOptions:
    """
    Représente une instruction Fanuc manipulable (chaînable).
    """

    def __init__(self, base_cmd):
        """
        Initialise l'instruction avec une commande de base.
        """
        self.cmd = base_cmd

    def offset(self, PR=100):
        """
        Ajoute un offset via un PR.
        """
        self.cmd += f" Offset,PR[{PR}]"
        return self

    def tool_offset(self, PR=100):
        """
        Ajoute un offset outil via un PR.
        """
        self.cmd += f" Tool_Offset,PR[{PR}]"
        return self
    
    def acceleration(self, ACC=150):
        """
        Ajoute une accélération spécifique.
        """
        self.cmd += f" ACC{ACC}"
        return self

    def __str__(self):
        """
        Conversion en chaîne pour écriture dans le fichier LS.
        """
        return self.cmd


class FanucGenerator:
    """
    Génère le code FANUC (instructions + positions) à partir
    d'un tableau de palpage.
    """

    def __init__(self):
        """
        Initialise le générateur.
        """


    @staticmethod
    def _fmt_vec(vec):
        """
        Formate un vecteur en chaîne 'x,y,z'.
        """
        return ",".join(map(str, vec))

    @staticmethod
    def raz_pr(pr=100, groupe='1,0,0,0,0'):
        """
        Remise à zéro d'un PR.
        Accepte groupe sous forme de chaîne '1,0,1,0,1' ou d'entier 10101.
        """
        bloc = []

        # Si c'est un int, le transformer en liste de '1'/'0'
        if isinstance(groupe, int):
            liste_groupe = list(str(groupe))
        else:
            liste_groupe = groupe.split(',')

        # Vérifier exactement '1,1,1,0,0'
        if liste_groupe[:3] == ['1','1','1'] and liste_groupe[3:] == ['0','0']:
            bloc.append(f"CALL RAZ_PR({pr})\n")
        else :
            # Sinon, appeler RAZ_PR_GP pour chaque PR actif
            for i, g in enumerate(liste_groupe):
                if g == '1':
                    bloc.append(f"CALL RAZ_PR_GP{i+1}({pr})\n")

        return bloc

    @staticmethod
    def move_do(n, state):
        """
        Change l'état de la DO dans l'état souhaité
        """
        return [f"DO[{n}={state}]\n"]

    @staticmethod
    def move_l(n, v=500, CNT=-1, pr=False):
        """
        Génère une instruction de mouvement linéaire (L).
        """
        lissage = "FINE" if CNT == -1 else f"CNT{CNT}"
        if not pr:
            return MouvementOptions(f"L P[{n}] {v}mm/sec {lissage}")
        else:
            return MouvementOptions(f"L PR[{n}] {v}mm/sec {lissage}")

    @staticmethod
    def move_j(n, v=20, CNT=-1, pr=False):
        """
        Génère une instruction de mouvement articulaire (J).
        """
        lissage = "FINE" if CNT == -1 else f"CNT{CNT}"
        if not pr:
            return MouvementOptions(f"J P[{n}] {v}% {lissage}")
        else:
            return MouvementOptions(f"J PR[{n}] {v}% {lissage}")
    
    @staticmethod
    def degagement_tool(axe, h):
        """
        Génère le bloc de dégagement outil.
        """
        bloc = [
            "!Degagement",
            f"CALL DEGAGEMENT_TOOL({axe},({h}))",
            "",
        ]
        return bloc
    
    @staticmethod
    def generer_point(point):
        """"
        Chaine de caractere dans la section /POS pour définir un point dans un programme FANUC
        Paramètres :
        - Dictionnaire contenant les informations nécéssaire

        Retour :
        - Liste de caractère des coordonées du point.
        """
        bloc = [f"P[{point['numero']}]{{"] # Double { pourqu'une seule s'affiche malgré la méthode f"{}"
        

        # Si c'est un int, le transformer en liste de '1'/'0'
        if isinstance(point['groupe'], int):
            liste_groupe = list(str(point['groupe']))
        else:
            liste_groupe = point['groupe'].split(',')

        for i, g in enumerate(liste_groupe):
            if g == '1':
                if point['mode'] == 'L':
                    bloc_gpx = [
                    f"    GP{i+1}:",
                    f"        UF : {point['uframegp1']}, UT : {point['utoolgp1']},",
                    f"        CONFIG : '{point[f'configgp{i+1}']}',",
                    f"        X = {point['x']:.3f} mm, "
                    f"Y = {point['y']:.3f} mm, "
                    f"Z = {point['z']:.3f} mm,",
                    f"        W = {point['w']:.3f} deg, "
                    f"P = {point['p']:.3f} deg, "
                    f"R = {point['r']:.3f} deg",
                    "};"
                    ]
                elif point['mode'] == 'J':
                    print("mode joint pas encore dev")
                else:
                    print("autre mode pas encore dev")
                bloc.extend(bloc_gpx)
        
        return bloc