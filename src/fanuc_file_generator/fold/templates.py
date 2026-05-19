

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
            "",
            f"SELECT R[{self.memo_positon}]=0, JMP LBL[999]"
        ])
        # Deuxième select pour arrêt pointé
        for i, value in enumerate(liste_numero):
            pattern = f"={value},CALL INIT_{liste_nom_programme[i]}"
            
            if i == 0 and False:
                self.bloc.append(f"SELECT R[{self.memo_positon}]{pattern}")
                continue
            
            self.bloc.append(f"            {pattern}")
            
        self.bloc.append("")

        self.bloc.extend([
            f"GO[1]={self.numero_alarme}",
            "PAUSE",
            "GO[1]=0",
            "JMP LBL[998]",
            ""
        ])
        
    def end_main(self, memo_programme, memo_piece, programme_rebut, 
                 memo_prehenseur, programme_prehenseur):
        self.bloc.extend([
            f"LBL[999]",
            f"R[{memo_programme}]=0",
            f"R[{self.memo_positon}]=0",
            f"IF R[{memo_piece}]<>0,CALL {programme_rebut}",
            f"R[{memo_prehenseur}]=0",
            f"CALL {programme_prehenseur}"
        ])

    def structure_select_half_sub_main(self, liste_numero_positon):
        """
        Structure logique pour choisir le prochain point à exécuter
        """        
        # Premier select en cas de traj stoppé
        self.bloc.append(f"SELECT R[{self.memo_positon}]=0.5,JMP LBL[999]")
        for i, value in enumerate(liste_numero_positon):
            pattern = f"={float(value)+0.5},JMP LBL[{liste_numero_positon[i]}]"            
            self.bloc.append(f"       {pattern}")
        
    def structure_select_sub_main(self, liste_numero_positon, offset):
        """
        Structure logique pour choisir le prochain point à exécuter
        """
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
        
    def end_sub_main(self):
        self.bloc.extend([
            "!Fin des trajectoires",
            "LBL[999]"
        ])

    