from fanuc_file_generator.utils.geometrie import point_cercle_portion

class PalpageCentreOutils:
    """
    Permet de génrer les coordonnées des points de palpage pour chaque centre le table.
    """
    
    def __init__(self, lines, parametres_globaux):
        """
        Initialise les paramètres principaux de la table
        """
        self.lines = lines
        self.parametres = parametres_globaux
        
        self.tableau_centres = []
        self.tableau_palpage = []
        
        self.n_points = parametres_globaux["nbr_points"]
        
        self.ufgp1 = parametres_globaux["uframegp1"]
        self.utgp1 = parametres_globaux["utoolgp1"]

    def set_tableau_palpages(self):
        """
        Crée le tableau des points de palpage.
        """
        self.tableau_palpage = [
            [None for _ in range(len(line)*self.n_points)]
            for line in self.tableau_centres
        ]
        
    def get_parametres_centre(self, line):
        """
        Récupère les paramètres nécessaires à la génération des centres à partir d'une ligne.
        """
        #Récupération des paramètre de la ligne
        start = line["debut"]               # Numéro du premier centre de la ligne
        end = line["fin"]                   # Numéro du dernier centre de la ligne
        orientation = line["orientation"]   # Orientation de la ligne (0 ou 180)
        y0_line = line["y0"]                # Y de départ
        pas_y_line = line["pas_y"]          # incrément Y
        
        return start, end, orientation, y0_line, pas_y_line
    
    def set_sens_palpage(self, orientation):
        """
        Détermine le sens du palpage en fonction de l'orientation de la ligne.
        """
        return 1 if orientation == 180 else -1
        
    def set_centres(self, line, x):
        """
        Génère les centres à palper pour une ligne donnée.
        """
        # Initialisation de la liste des centres pour la ligne
        line_centres = []
        
        # Récupération des paramètre de la ligne
        start, end, orientation, y0_line, pas_y_line = self.get_parametres_centre(line)

        # Sens du dégagement selon l'orientation
        sens_degagement = self.set_sens_palpage(orientation)

        # Initialisation de la position Y pour la ligne
        y = y0_line
        
        for numero in range(start, end + 1):
            centre = {
                "numero": numero,
                "x": x,   # X cumulatif
                "y": y,   # Y spécifique à la ligne
                "orientation": orientation,
                **self.parametres  # injection des paramètres globaux
            }

            # Application du sens au décalage de dégagement
            centre["offset_degagement"] = sens_degagement * centre["offset_degagement"]
            line_centres.append(centre)
            y += pas_y_line  # Incrément Y pour le prochain centre

        return line_centres
    
    def set_tableau_centres(self):
        """
        Génère le tableau des centres à palper à partir des lignes.
        """
        x = 0  # Position X initiale

        for line in self.lines:
            line_centres = self.set_centres(line, x)
            self.tableau_centres.append(line_centres)
            x += line["pas_x"]  # Incrément X pour la prochaine ligne
    
    def set_plan(self, centre, n, i, j, portion, start_x, start_y):
        """
        Génère les points de palpage du plan autour d'un centre.
        """

        sens_palpage = self.set_sens_palpage(centre['orientation'])

        # Calcul du point sur le cercle du plan
        x, y, direction = point_cercle_portion(
            (centre["x"], centre["y"]),
            centre["diametre_plan"],
            portion,
            self.n_points,
            start_x*sens_palpage,
            start_y,
            sens_palpage
        )
        
        self.tableau_palpage[i][j] = {
            "numero": n,
            "uframegp1": self.ufgp1,
            "utoolgp1": self.utgp1,
            "x": x,
            "y": y,
            "z": (centre["hauteur_max"] - centre["distance_z_palpage_point_part"] 
                  + centre["diamètre_bille_palpeur"]),
            "w": centre["w"],
            "p": centre["p"],
            "r": centre["r"],
            'hauteur_deplacement' : centre['hauteur_deplacement'],
            "direction": direction,
        }
        
    def set_cercle_ext(self, centre , n , i, j):
        """
        Génère le point d'approche pour le palpage du cercle extérieur
        pour chaque centre.
        """
        self.tableau_palpage[i][j] = {
            "numero": n,
            "uframegp1": self.ufgp1,
            "utoolgp1": self.utgp1,
            "x": centre["x"] - centre["diametre_cercle"]/2 - 10,  # marge d'approche
            "y": centre["y"],
            "z": centre["hauteur_max"] - centre["distance_z_palpage_cercle"],
            "w": centre["w"],
            "p": centre["p"],
            "r": centre["r"],
            "diametre": centre["diametre_cercle"],
            "hauteur_deplacement": centre["hauteur_deplacement"]
        }
                
    def set_cercle_int(self, centre, n, i, j):
        """
        Génère le point d'approche pour le palpage du cercle intérieur
        pour chaque centre.
        """
        self.tableau_palpage[i][j] = {
            "numero": n,
            "uframegp1": self.ufgp1,
            "utoolgp1": self.utgp1,
            "x": centre["x"] + centre["diametre_cercle"]/2 + 10,  # marge d'approche
            "y": centre["y"],
            "z": centre["hauteur_max"] - centre["distance_z_palpage_cercle"],
            "w": centre["w"],
            "p": centre["p"],
            "r": centre["r"],
            "diametre": centre["diametre_cercle"],
            "hauteur_deplacement": centre["hauteur_deplacement"]
        }
        
        