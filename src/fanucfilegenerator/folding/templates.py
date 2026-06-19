

class InitGenerator:
    """
    Génère un programme d'init pour le robot à partir d'une liste de points
    """

    def __init__(self, name_prog, alarme_value, prefixe_init="", do_ec=0, memo_positon=0):
        """
        Initialise la génération de l'init robot
        """
        
        self.alarme_value = alarme_value
        
        self.bloc = [
        "!Init généré automatiquement",
        f"!Relatif à {name_prog}",
        ""
        ]
        
        self.prefixe_init = prefixe_init
        
        self.do_ec = do_ec
        
        self.memo_positon = memo_positon
        
        
        
    def add_bloc(self, bloc):
        self.bloc.extend(bloc)
        
    def add_alarme(self):
        self.bloc.extend([
            "LBL[997]",
            f"GO[1]={self.alarme_value}",
            "PAUSE",
            "GO[1]=0",
            "JMP LBL[998]",
            ""
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
    
    def structure_select_main_register(self, liste_numero, liste_nom_programme):
        """
        
        """
        self.bloc.extend([
            "LBL[998]",
            "",
            f"SELECT R[{self.memo_positon}]=0, JMP LBL[999]"
        ])
        # Deuxième select pour arrêt pointé
        for i, value in enumerate(liste_numero):
            pattern = f"={value},CALL {self.prefixe_init}{liste_nom_programme[i]}"
                        
            self.bloc.append(f"            {pattern}")
            
        self.bloc.extend([
            "            ELSE, JMP LBL[997]",
            "",
            "JMP LBL[999]"                         
            ])

        self.add_alarme()
        
    def end_main_register(self, is_gst_rebut, is_gst_prehenseur, programme_rebut="", programme_prehenseur="", register_prehenseur=0):
        self.bloc.extend([
            "LBL[999]",
            ""
        ])
        
        if is_gst_rebut:
            self.bloc.append(f"CALL {programme_rebut}")
        
        if is_gst_prehenseur:
            self.bloc.extend([
                f"R[{register_prehenseur}]=0",
                f"CALL {programme_prehenseur}"
                ])
    
    def structure_select_main_dido(self, liste_di, liste_programme, register_init):
        self.bloc.extend([
            "LBL[998]",
            "",
        ])
            
        for i in range(len(liste_di)):
            self.bloc.append(f"IF DI[{liste_di[i]}]=ON, CALL {liste_programme[i]}")
        
        self.bloc.extend([
            f"IF R[{register_init}]<>0, JMP LBL[997]",
            "",
            "JMP LBL[999]",
            ""           
        ])
        
        self.add_alarme()
    
    def end_main_dido(self, is_gst_rebut, is_gst_prehenseur, programme_rebut="", programme_prehenseur="", register_prehenseur=0):
        self.bloc.extend([
            "LBL[999]",
            ""
        ])
        
        if is_gst_rebut:
            self.bloc.append(f"CALL {programme_rebut}")
        
        if is_gst_prehenseur:
            self.bloc.extend([
                f"R[{register_prehenseur}]=0",
                f"CALL {programme_prehenseur}"
                ])
    
    def start_sub_main_register(self):
        pass
    
    def start_sub_main_di_do(self):
        self.bloc.extend([
            f"DO[{self.do_ec}]=ON",
            ""
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
            f"GO[1]={self.alarme_value}",
            "PAUSE",
            "GO[1]=0",
            "JMP LBL[998]",
            "",
            "!Début des trajectoires",
            ""
        ])
        
    def end_sub_main_register(self):
        self.bloc.extend([
            "!Fin des trajectoires",
            "LBL[999]",
        ])
        
    def end_sub_main_di_do(self, do_end):
        self.bloc.extend([
            "!Fin des trajectoires",
            "LBL[999]",
            f"DO[{self.do_ec}]=OFF",
            f"DO[{do_end}]=PULSE,0.5sec",
        ])

    