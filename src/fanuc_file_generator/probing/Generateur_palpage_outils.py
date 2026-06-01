import os
import shutil

from UTILITAIRE.Name import NameBuilder

from FANUC.Fanuc import FanucGenerator
from FANUC.Fanuc import TextFileBuilder
from FANUC.Palpage import GrilleCentres
from FANUC.Palpage import GenerateurPalpage


# --- PARAMÉTRAGE ---
# Définition des lignes réelles du magasin
lignes_réel = [
    {"debut": 1, "fin": 15, "orientation": 0, "pas_x": 20, "y0": 45, "pas_y": 92},
    {"debut": 16, "fin": 30, "orientation": 0, "pas_x": 270, "y0": 45, "pas_y": 92},
    {"debut": 31, "fin": 40, "orientation": 180, "pas_x": 480, "y0": 59, "pas_y": 140}
]

# Paramètres communs à tous les outils
parametres_globaux = {
    "offset_degagement": 63,            # distance pour retirer l'outil après palpage
    "diametre_cercle": 47,              # diamètre utilisé pour le palpage du cercle extérieur
    "distance_z_palpage_cercle": 14,    # distance verticale depuis le sommet pour palpage cercle
    "diametre_plan": 58,                # diamètre utilisé pour le palpage du plan
    "distance_z_palpage_point_part": 32,# distance verticale depuis le sommet pour palpage plan
    "hauteur_deplacement": 80,          # hauteur de sécurité pour les déplacements du TCP
    "hauteur_max": 54,                  # hauteur du sommet de l'outil dans le magasin
    "w": 180,                           # orientation W du TCP
    "p": 0,                             # orientation P du TCP
    "r": -120,                          # orientation R du TCP
    "diamètre_bille_palpeur": 6         # diamètre de la bilel rubis sur le stylet du palpeur
}

hauteur = parametres_globaux['hauteur_deplacement'] - (parametres_globaux["hauteur_max"] - parametres_globaux["distance_z_palpage_point_part"] + parametres_globaux["diamètre_bille_palpeur"])

# Dossier de sortie des fichiers LS
output_dir = "output_palpage"
os.makedirs(output_dir, exist_ok=True)

# --- Génération des fichiers par ligne ---
# Liste globale pour stocker les centres de toutes les lignes
tableau_centres_global = []

name_main = 'AAAAA'

# Nom de sous programme modulaire
name_inter = '_LIGNE_'
name_builder = NameBuilder(
    "{name_main}{name_inter}{i_ligne:02d}",
    name_main=name_main,
    name_inter=name_inter
)

nbr_points = 3

# Boucle sur chaque ligne réelle pour générer un programme dédié
for i_ligne, ligne in enumerate(lignes_réel, start=1):
    name_submain = name_builder.build(i_ligne=i_ligne)

    # Génération des centres pour cette ligne uniquement
    grille = GrilleCentres([ligne], parametres_globaux)
    tableau_centres = grille.generer()

    # Stockage des centres pour le programme principal
    tableau_centres_global.append(tableau_centres[0])

    # Génération des points de palpage (cercle + plan) pour cette ligne
    palpage = GenerateurPalpage(tableau_centres, nbr_points=nbr_points)
    tableau_palpage = palpage.generer()

    # Génération du code FANUC logique (MN) et des positions (POS)
    fanuc = FanucGenerator(tableau_palpage, nbr_points)
    code_logique, position_palpage = fanuc.generer_code_palpage()

    # Construction du fichier LS pour cette ligne
    code_final = TextFileBuilder(
        name_submain,
        comment=f"Palpage Ligne {i_ligne}",
        output_dir=output_dir
    )
    code_final.add_mn_lines(code_logique)      # Ajout de la logique
    code_final.add_pos_lines(position_palpage) # Ajout des positions
    code_final.build_file()                    # Écriture du fichier

# --- Génération du programme principal ---
# Création du fichier principal qui appelle chaque ligne
prog_principal = TextFileBuilder(
    name_main,
    comment="Main Palpage magasin",
    output_dir=output_dir
)

pr_tempo = 99
point_ref = tableau_palpage[0][0]
# Instructions initiales du programme principal
mn_lines_principal = [
    "!--- TEST ---",
    "",
    "!RAZ GP3",              # Remise à zéro des groupes
    "CALL ZERO_GRP3",
    "",
    "!Definition repere",     # Définition du repère et de l'outil actifs
    f"UFRAME_NUM={point_ref['uframegp1']}",
    f"UTOOL_NUM={point_ref['utoolgp1']}",
    "",
    f"PR[{pr_tempo}]=LPOS",
    f"IF (PR[{pr_tempo},3]<{point_ref['hauteur_deplacement']}) THEN",
    f"PR[{pr_tempo},3]={point_ref['hauteur_deplacement']}",
    FanucGenerator.move_l(pr_tempo, pr=True),
    "ENDIF",
    "",
    
    *FanucGenerator.raz_pr(),
    f"PR[100,3]=({hauteur})",
    "",
    *FanucGenerator.activer_palpeur_mobile(),  # Activation du palpeur
]

# Appel de chaque programme de ligne
for i_ligne in range(1, len(tableau_centres_global) + 1):
    mn_lines_principal.append(f"CALL {name_builder.build(i_ligne=i_ligne)}")

# Désactivation du palpeur en fin de programme
mn_lines_principal.append("")
mn_lines_principal.extend(FanucGenerator.desactiver_palpeur())

# Écriture finale du programme principal
prog_principal.add_mn_lines(mn_lines_principal)
prog_principal.build_file()

# copié dans clé usb
try:
    source = "T:/Sab Robotique/03-MACHINE STANDARD/25-XXX-Box d'usinage/07-R&D/04-PALPEUR/01-RENISHAW/Generation python/output"
    destination = "D:/output"

    shutil.copytree(source, destination, dirs_exist_ok=True)
except Exception as e:
    print("Erreur :", e)