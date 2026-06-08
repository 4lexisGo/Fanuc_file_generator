from fanuc_file_generator.ls_generator.build import LSFileBuilder, LSFileEditer
from fanuc_file_generator.ls_generator.parser import LSFileFilter
from fanuc_file_generator.utils.file import normalize_extensions, get_fichiers
from fanuc_file_generator.fold.templates import InitGenerator

from pathlib import Path
import shutil

def create_folders(PATH_GLOBAL):
    PATH_SOURCE = PATH_GLOBAL/"SOURCE"
    PATH_CALCUL = PATH_GLOBAL/"CALCUL"
    PATH_PINCE = PATH_GLOBAL/"PINCE"
    PATH_DESTINATION = PATH_GLOBAL/"DESTINATION"
    PATH_EDIT = PATH_GLOBAL/"EDIT"

    # Crée le dossier destination s'il n'existe pas
    PATH_GLOBAL.mkdir(exist_ok=True)
    PATH_SOURCE.mkdir(exist_ok=True)
    PATH_CALCUL.mkdir(exist_ok=True)
    PATH_PINCE.mkdir(exist_ok=True)
    PATH_DESTINATION.mkdir(exist_ok=True)
    
    return PATH_SOURCE, PATH_CALCUL, PATH_PINCE, PATH_DESTINATION, PATH_EDIT

def main(memo_programme, memo_init, numero_alarme, memo_piece, 
         memo_prehenseur, programme_prehenseur, programme_rebut, 
         project_name, main_name, name_init, commentaire_init,
         PATH_GLOBAL, abort_on_missing_argument
    ):

    PATH_SOURCE, PATH_CALCUL, PATH_PINCE, PATH_DESTINATION, PATH_EDIT = create_folders(PATH_GLOBAL)

    # Copie le dossier source
    shutil.rmtree(PATH_EDIT, ignore_errors=True)
    shutil.copytree(PATH_SOURCE, PATH_EDIT)

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
            if abort_on_missing_argument:
                continue
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
        obj1.structure_select_half_sub_main(liste_valeur_registre)
        obj1.structure_select_sub_main(liste_valeur_registre, liste_offset)
        for i, bloc in enumerate(liste_bloc):
            obj1.structure_indiv(i+1, bloc)
        obj1.end_sub_main()

        # Construction du sous programme d'init
        obj3 = LSFileBuilder(
            name=f"{name_init}{programme.stem}",
            comment=commentaire_init,
            output_dir=PATH_DESTINATION
        )
        obj3.add_mn_lines(obj1.bloc)
        obj3.add_pos_lines(pos_lines)
        obj3.build_file()
        
        
        
    init_principale = InitGenerator(project_name, memo_programme, numero_alarme)

    init_principale.structure_select_main(
        liste_value_memo_programme,
        liste_nom_programme
    )
    init_principale.end_main(memo_programme, memo_piece, programme_rebut, 
                             memo_prehenseur, programme_prehenseur)

    init_principale_file = LSFileBuilder(name=f"{name_init}{main_name}", comment=commentaire_init, output_dir=PATH_DESTINATION)
    init_principale_file.add_mn_lines(init_principale.bloc)
    init_principale_file.build_file()

def edit(path_source, path_init, prefixe):
    """
    
    """
    normalize_extensions(path_source)
    liste_source = get_fichiers(path_source, root=True)

    normalize_extensions(path_init)
    liste_init = get_fichiers(path_init, root=True)

    # Vérification du nombre
    if len(liste_source) != len(liste_init):
        raise ValueError(
            f"Nombre de fichiers différent : "
            f"{len(liste_source)} source(s) / {len(liste_init)} init(s)"
        )

    # Vérification des correspondances
    fichiers_init = {f.name for f in liste_init}

    for programme in liste_source:
        expected_name = f"{prefixe}{programme.name}"

        if expected_name not in fichiers_init:
            raise FileNotFoundError(
                f"Fichier INIT manquant pour {programme.name} "
                f"(attendu : {expected_name})"
            )

    # Traitement
    for programme in liste_source:
        obj = LSFileFilter(66)

        pos_lines = obj.keep_pos(programme)

        file_init = path_init / f"{prefixe}{programme.name}"

        obj1 = LSFileEditer(file_init)
        obj1.overwrite_pos(pos_lines)

        
    
if __name__ == "__main__":
    
    """memo_programme = 100
    memo_init = 99
    numero_alarme = 32
    memo_piece = 99
    memo_prehenseur = 98

    programme_prehenseur = "CHANG_OUTIL"
    programme_rebut = "REBUT"

    project_name = "CHASSIGNOL"
    main_name = "CYCLE1"

    name_init = "INIT_"

    commentaire_init = "Génération auto"

    PATH_GLOBAL = Path(r"TEST")

    abort_on_missing_argument = False
    
    main(memo_programme, memo_init, numero_alarme, memo_piece, 
         memo_prehenseur, programme_prehenseur, programme_rebut, 
         project_name, main_name, name_init, commentaire_init,
         PATH_GLOBAL, abort_on_missing_argument
        )"""
    
    path_source = Path(r"C:\Users\alexis.gosetto\Desktop\EDIT_INIT\SOURCE")
    path_init = Path(r"C:\Users\alexis.gosetto\Desktop\EDIT_INIT\INIT")

    prefixe = "INIT_"

    edit(path_source, path_init, prefixe)

