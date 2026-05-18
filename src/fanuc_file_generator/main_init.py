from fanuc_file_generator.ls_generator.build import LSFileBuilder, LSFileEditer
from fanuc_file_generator.ls_generator.parser import LSFileFilter
from fanuc_file_generator.utils.file import get_fichiers
from fanuc_file_generator.fold.templates import InitGenerator

from pathlib import Path
import shutil

memo_programme = 30
memo_init = 31
numero_alarme = 32
memo_piece = 99
memo_prehenseur = 98

programme_prehenseur = "CHANG_OUTIL"
programme_rebut = "REBUT"

PATH_GLOBAL = Path(r"TEST_INIT")

PATH_SOURCE = PATH_GLOBAL/"SOURCE"
PATH_CALCUL = PATH_GLOBAL/"CALCUL"
PATH_PINCE = PATH_GLOBAL/"PINCE"
PATH_DESTINATION = PATH_GLOBAL/"DESTINATION"
PATH_EDIT = PATH_GLOBAL/"EDIT"

# Vérifie que le dossier source existe
if not PATH_SOURCE.exists():
    raise FileNotFoundError(f"Le dossier source n'existe pas : {PATH_SOURCE}")

shutil.rmtree(PATH_EDIT, ignore_errors=True)
shutil.copytree(PATH_SOURCE, PATH_EDIT)

# Vérifie que le dossier calcul existe
if not PATH_CALCUL.exists():
    raise FileNotFoundError(f"Le dossier calcul n'existe pas : {PATH_CALCUL}")

# Vérifie que le dossier pince existe
if not PATH_PINCE.exists():
    raise FileNotFoundError(f"Le dossier pince n'existe pas : {PATH_PINCE}")

# Crée le dossier destination s'il n'existe pas
PATH_DESTINATION.mkdir(exist_ok=True)

# Récupération des fichiers
liste_programme = get_fichiers(PATH_EDIT, root=True)
liste_calcul = get_fichiers(PATH_CALCUL)
liste_pince = get_fichiers(PATH_PINCE)

# Résultats
liste_nom_programme = []
liste_value_memo_programme = []

for programme in liste_programme:

    # Création de l'objet parser
    sub_obj = LSFileFilter(memo_programme)

    # Extraction des lignes MN
    mn_lines = sub_obj.keep_mn(programme, rule=False)

    # Récupération de la dernière valeur du registre
    last_value = sub_obj.get_last_r_value(mn_lines, memo_programme)
            
    # Vérifie la conformité du programme
    if last_value is None:
        print(f"{programme.name} : absence de registre programme")
        last_value = 0
        #continue
    else:
        last_value = int(last_value)

    # Stockage
    liste_nom_programme.append(programme.stem)
    liste_value_memo_programme.append(last_value)
    
    # Création de l'objet parser
    obj = LSFileFilter(memo_init, liste_calcul, liste_pince)
            
    # Création du sous programme init
    obj1 = InitGenerator(f"{programme.stem}", memo_init, numero_alarme)

    # Tri des lignes MN et POS du programme d'origine
    pos_lines = obj.keep_pos(programme)

    # Edition des registres d'init sur les lignes MN triées
    mn_lines = obj.keep_mn(programme, rule=False)
    obj2 = LSFileEditer(programme)
    mn_lines = obj2.overwrite_mn_memo(mn_lines, memo_init, liste_pince)
    obj2.overwrite_mn(mn_lines)
    
    # Extraction des lignes MN
    mn_lines = obj.keep_mn(programme)
    
    # Construction finales de la section MN
    liste_bloc, liste_valeur_registre, liste_offset = obj.extract_blocks_table(mn_lines)
    obj1.structure_select(liste_valeur_registre, liste_offset)
    for i, bloc in enumerate(liste_bloc):
        obj1.structure_indiv(i+1, bloc)
    obj1.add_bloc_end()

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
init_principale.add_bloc([
    f"R[{memo_programme}]=0",
    f"R[{memo_init}]=0",
    f"IF R[{memo_piece}]<>0,CALL {programme_rebut}",
    f"R[{memo_prehenseur}]=0",
    f"CALL {programme_prehenseur}"
    ])

init_principale_file = LSFileBuilder(name="INIT_SAB01", comment="Génération auto", output_dir=PATH_DESTINATION)
init_principale_file.add_mn_lines(init_principale.bloc)
init_principale_file.build_file()