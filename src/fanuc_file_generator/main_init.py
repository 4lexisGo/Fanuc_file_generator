from fanuc_file_generator.ls_generator.parser import LSFileFilter
from fanuc_file_generator.utils.file import get_fichiers
from fanuc_file_generator.fold.templates import InitGenerator

from pathlib import Path


memo_programme = 38
memo_init = 66

PATH = r"C:/Users/alexis.gosetto/OneDrive - GROUPE SAB/Bureau/TEST_INIT/SOURCE"

# Récupération des fichiers
liste_programme = get_fichiers(PATH)

# Résultats
liste_objet_programme = []
liste_nom_programme = []
liste_mn_lines = []
liste_value_memo_programme = []

for programme in liste_programme:

    # Création de l'objet parser
    obj = LSFileFilter(memo_programme)

    # Extraction des lignes MN
    mn_lines = obj.keep_mn(PATH / programme)

    # Récupération de la dernière valeur du registre
    last_value = obj.get_last_r_value(mn_lines, memo_programme)

    if last_value is None:
        print(f"{programme.name} : abscence de registre")
        continue

    # Stockage
    liste_objet_programme.append(obj)
    liste_nom_programme.append(Path(programme).stem)
    liste_mn_lines.append(mn_lines)
    liste_value_memo_programme.append(last_value)

    

init_principale = InitGenerator("FAIVELAY", memo_programme, 99)
init_principale.structure_select_main(liste_value_memo_programme, liste_nom_programme)

print("")

for line in init_principale.bloc:
    print(line)