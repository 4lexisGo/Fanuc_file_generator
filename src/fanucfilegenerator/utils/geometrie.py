import math

def point_cercle_portion(centre=(0,0), diametre=50, portion=1, total_points=3, start_x=0, start_y=1, sens=1):
    """
    Calcule les coordonnées d'un point situé sur un cercle, réparti uniformément.

    Paramètres :
    - centre : tuple (Cx, Cy) → centre du cercle
    - diametre : diamètre du cercle
    - portion : index du point souhaité (entre 1 et total_points)
    - total_points : nombre total de points à répartir sur le cercle
    - start_x, start_y : vecteur directionnel du point de départ
    - sens : sens de rotation (1 = anti-horaire, -1 = horaire)

    Retour :
    - Tuple (x, y) arrondi à 3 décimales
    """

    # Vérification des bornes de l'index du point
    if portion < 1 or portion > total_points:
        raise ValueError(f"portion doit être entre 1 et {total_points}")

    # Vérification du vecteur de départ
    if not (-1 <= start_x <= 1 and -1 <= start_y <= 1):
        raise ValueError("start_x et start_y doivent être entre -1 et 1")

    # Vérification du sens de rotation
    if sens not in (-1, 1):
        raise ValueError("sens doit valoir 1 (anti-horaire) ou -1 (horaire)")

    Cx, Cy = centre
    r = diametre / 2

    # Calcul de l'angle initial à partir du vecteur de départ
    angle_depart = math.atan2(start_y, start_x)

    # Calcul de l'angle correspondant à la portion demandée
    angle = angle_depart + sens * (portion - 1) * (2 * math.pi / total_points)

    # Calcul des coordonnées finales
    x = Cx + r * math.cos(angle)
    y = Cy + r * math.sin(angle)

    return (round(x, 3), round(y, 3))
