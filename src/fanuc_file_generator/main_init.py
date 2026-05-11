from fanuc_file_generator.ls_generator.build import LSFileBuilder, LSFileEditer
from fanuc_file_generator.ls_generator.parser import LSFileFilter
from fanuc_file_generator.utils.file import get_fichiers
from fanuc_file_generator.fold.templates import InitGenerator

from pathlib import Path


memo_programme = 38
memo_init = 66
numero_alarme = 99

PATH_SOURCE = Path(r"C:/Users/algo4/Desktop/TEST_INIT/SOURCE")
PATH_DESTINATION = Path(r"C:/Users/algo4/Desktop/TEST_INIT/DESTINATION")

# Vérifie que le dossier source existe
if not PATH_SOURCE.exists():
    raise FileNotFoundError(f"Le dossier source n'existe pas : {PATH_SOURCE}")

# Crée le dossier destination s'il n'existe pas
PATH_DESTINATION.mkdir(exist_ok=True)

# Récupération des fichiers
liste_programme = get_fichiers(PATH_SOURCE)

# Résultats
liste_objet_programme = []
liste_nom_programme = []
liste_mn_lines = []
liste_value_memo_programme = []

for programme in liste_programme:

    # Création de l'objet parser
    obj = LSFileFilter(memo_programme)

    # Extraction des lignes MN
    mn_lines = obj.keep_mn(programme, rule=False)

    # Récupération de la dernière valeur du registre
    last_value = obj.get_last_r_value(mn_lines, memo_programme)
            
    # Vérifie la conformité du programme
    if last_value is None:
        print(f"{programme.name} : absence de registre")
        continue
    else:
        last_value = int(last_value)
    
    if last_value == 4 and False:
        for line in mn_lines:
            print(line)

    # Stockage
    liste_nom_programme.append(programme.stem)
    liste_value_memo_programme.append(last_value)
    
    # Création de l'objet parser
    obj = LSFileFilter(memo_init)

    # Extraction des lignes MN
    mn_lines = obj.keep_mn(programme)
            
    # Création du sous programme init
    obj1 = InitGenerator(f"INT_{programme.stem}", memo_init, numero_alarme)

    # Tri des lignes MN et POS du programme d'origine
    pos_lines = obj.keep_pos(programme)

    # Edition des registres d'init sur les lignes MN triées
    obj2 = LSFileEditer(programme)
    mn_lines = obj2.overwrite_mn_memo(mn_lines, memo_init)
    
    # Construction finales de la section MN
    liste_bloc, liste_valeur_registre, liste_offset = obj.extract_blocks_table(mn_lines)
    obj1.structure_select(liste_valeur_registre, liste_offset)
    for i, bloc in enumerate(liste_bloc):
        obj1.structure_indiv(i, bloc)

    # Construction du sous programme d'init
    obj3 = LSFileBuilder(
        name=f"INT_{programme.stem}",
        comment="Génération auto",
        output_dir=PATH_DESTINATION
    )
    obj3.add_mn_lines(obj1.bloc)
    obj3.add_pos_lines(pos_lines)
    obj3.build_file()
    
    
    
init_principale = InitGenerator("FAIVELAY", memo_programme, numero_alarme)

init_principale.structure_select_main(
    liste_value_memo_programme,
    liste_nom_programme
)
init_principale.add_bloc_end()
init_principale.add_bloc([f"R[{memo_init}]=0"])

init_principale_file = LSFileBuilder(name="INIT_SAB01", comment="Génération auto", output_dir=PATH_DESTINATION)
init_principale_file.add_mn_lines(init_principale.bloc)
init_principale_file.build_file()
