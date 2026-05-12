

class InitGenerator:
    """
    Génère un programme d'init pour le robot à partir d'une liste de points
    """

    def __init__(self, name_prog, memo_positon, numero_alarme):
        """
        Initialise la génération de l'init robot
        """
        self.memo_positon = memo_positon
        self.numero_alarme = numero_alarme

        self.bloc = [
        "!Init généré automatiquement",
        f"!programme référence {name_prog}",
        ""
        ]
        
    def add_bloc(self, bloc):
        self.bloc.extend(bloc)
        
    def add_bloc_end(self):
        self.bloc.extend([
            "LBL[999]"
        ])
    
    def structure_indiv(self, i, liste):
        """
        Strucure individuelle pour avancer au point suivant l'init
        """
        bloc = [f"LBL[{i}]"]
        
        bloc.extend(liste)
        
        bloc.extend([
            f"JMP LBL[998]",
            ""
            ])

        self.bloc.extend(bloc)
    
    def structure_select_main(self, liste_numero, liste_nom_programme):
        """
        
        """
        self.bloc.extend([
            "LBL[998]",
            ""
        ])
        # Deuxième select pour arrêt pointé
        for i, value in enumerate(liste_numero):
            pattern = f"={value},CALL {liste_nom_programme[i]}"
            if value == liste_numero[0]:
                self.bloc.append(f"SELECT R[{self.memo_positon}]{pattern}")
                continue
            
            self.bloc.append(f"       {pattern}")
            
        self.bloc.append("")

        self.bloc.extend([
            f"GO[1]={self.numero_alarme}",
            "PAUSE",
            "GO[1]=0",
            "JMP LBL[998]",
            "",
            "!Début des trajectoires",
            ""
        ])

    def structure_select(self, liste_numero_positon, offset):
        """
        Structure logique pour choisir le prochain point à exécuter
        """

        # Premier select en cas de traj stoppé
        for i, value in enumerate(liste_numero_positon):
            pattern = f"={float(value)+0.5},JMP LBL[{liste_numero_positon[i]}]"
            if value == liste_numero_positon[0]:
                self.bloc.append(f"SELECT R[{self.memo_positon}]{pattern}")
                continue
            
            self.bloc.append(f"       {pattern}")
            
        self.bloc.extend([
            "",
            "LBL[998]",
            ""
        ])

        # Deuxième select pour arrêt pointé
        for i, value in enumerate(liste_numero_positon):
            pattern = f"={value},JMP LBL[999]"
            if value == liste_numero_positon[0]:
                self.bloc.append(f"SELECT R[{self.memo_positon}]{pattern}")
                continue
            
            if value == liste_numero_positon[-1]:
                self.bloc.append(f"       {pattern}")
                continue
            
            self.bloc.append(f"       ={value},JMP LBL[{liste_numero_positon[i+offset[i]]}]")
            
        self.bloc.append("")

        self.bloc.extend([
            f"GO[1]={self.numero_alarme}",
            "PAUSE",
            "GO[1]=0",
            "JMP LBL[998]",
            "",
            "!Début des trajectoires",
            ""
        ])

    