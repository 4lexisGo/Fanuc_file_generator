from fanuc_file_generator.ls_generator.build import LSFileBuilder, LSFileEditer
from fanuc_file_generator.ls_generator.parser import LSFileFilter
from fanuc_file_generator.utils.file import normalize_extensions, get_fichiers
from fanuc_file_generator.fold.templates import InitGenerator
from fanuc_file_generator.utils.config_data import GenInitConfig, EditInitConfig

from pathlib import Path
import shutil
import os

def create_folders_gen_init(PATH_GLOBAL):
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
    shutil.rmtree(PATH_DESTINATION, ignore_errors=True)
    PATH_DESTINATION.mkdir(exist_ok=True)
    
    return PATH_SOURCE, PATH_CALCUL, PATH_PINCE, PATH_DESTINATION, PATH_EDIT

class GenInit:
    def __init__(self, config: GenInitConfig, console=None):
        self.config = config
        self.console = console
        
        self.liste_nom_programme = []
        self.liste_value_register_programme = []

        self.main()

    def gst_liste_do(self):

        if self.config.is_di_start_stop:
            liste_di = list(range(self.config.di_start, self.config.di_stop+1))

        elif self.config.is_di_liste:
            liste_di = self.config.di_liste

        else:
            self.console.log("Pas de gestion de di selectionné")
            raise ValueError("Pas de gestion de di selectionné")
        
        nb_prog = len(liste_di)
        do_stop = self.config.do_start + nb_prog*2

        liste_do_ec = []
        liste_do_end = []
        
        if self.config.is_alternated_do_value:
            for idx, i in enumerate(range(self.config.do_start, do_stop)):
                if idx % 2 == 0:
                    liste_do_ec.append(i)
                else:
                    liste_do_end.append(i)
        else:
            liste_do_ec = list(range(self.config.do_start, self.config.do_start+nb_prog))
            liste_do_end = list(range(self.config.do_start+nb_prog, do_stop+1))
        return liste_di, liste_do_ec, liste_do_end
        
    def gst_dido(self):

        liste_di, liste_do_ec, liste_do_end = self.gst_liste_do()
        liste_di.append(0)
        liste_do_ec.append(0)
        liste_do_end.append(0)
        
        for i, programme in enumerate(self.liste_programme):

            # Création du nom du sous programme d'init
            stem_prog_init = f"{self.config.prefixe_init}{programme.stem}"
            
            # Création de l'objet parser
            sub_obj = LSFileFilter()

            # Extraction des lignes MN
            mn_lines = sub_obj.keep_mn(programme, rule=False)

            # Récupération de la dernière valeur du registre
            first_value = sub_obj.get_first_do_value(mn_lines, liste_do_ec)
            
            # Vérifie la conformité du programme
            if first_value is None:
                self.console.warning(f"{programme.name} : absence de registre programme")
                print(f"{programme.name} : absence de registre programme")
                if self.config.abort_on_missing_argument:
                    continue
                first_value = 0
                index = -1
                self.liste_nom_programme.append(stem_prog_init)
                self.liste_value_register_programme.append(0)
            else:
                index = liste_do_ec.index(first_value)
                self.liste_nom_programme.append(stem_prog_init)
                self.liste_value_register_programme.append(liste_di[index])
            
            # Création de l'objet parser
            obj = LSFileFilter(register_number=self.config.register_init, 
                               rules_calcul=self.liste_calcul, rules_pince=self.liste_pince)
                    
            # Création du sous programme init
            obj1 = InitGenerator(f"{programme.name}", self.config.alarme_value, 
                                 self.config.prefixe_init, liste_do_ec[index], self.config.register_init)

            # Tri des lignes MN et POS du programme d'origine
            pos_lines = obj.keep_pos(programme)

            # Edition des registres d'init sur les lignes MN triées
            mn_lines = obj.keep_mn(programme, rule=False)
            obj2 = LSFileEditer(programme)
            mn_lines = obj2.overwrite_mn_memo(mn_lines, self.config.register_init, self.liste_pince)
            obj2.overwrite_mn(mn_lines)
            
            # Extraction des lignes MN
            mn_lines = obj.keep_mn(programme)
            liste_bloc, liste_valeur_registre, liste_offset = obj.extract_blocks_table(mn_lines)
            
            # Construction finales de la section MN
            obj1.start_sub_main_di_do()
            obj1.structure_select_half_sub_main(liste_valeur_registre)
            obj1.structure_select_sub_main(liste_valeur_registre, liste_offset)
            for i, bloc in enumerate(liste_bloc):
                obj1.structure_indiv(i+1, bloc)
            obj1.end_sub_main_di_do(liste_do_end[index])
            
            # Construction du sous programme d'init
            obj3 = LSFileBuilder(
                name=stem_prog_init,
                comment=self.config.commentaire_init,
                output_dir=self.PATH_DESTINATION
            )
            obj3.add_mn_lines(obj1.bloc)
            obj3.add_pos_lines(pos_lines)
            obj3.build_file()
            
        init_principale = InitGenerator(self.config.project_name, self.config.alarme_value, self.config.prefixe_init)

        init_principale.structure_select_main_dido(
            self.liste_value_register_programme,
            self.liste_nom_programme, self.config.register_init
        )
        init_principale.end_main_dido(self.config.is_gst_rebut, 
                                      self.config.is_gst_prehenseur, 
                                      self.config.programme_rebut, 
                                      self.config.programme_prehenseur, 
                                      self.config.register_prehenseur)

        init_principale_file = LSFileBuilder(name=f"{self.config.prefixe_init}{self.config.main_name}", 
                                             comment=self.config.commentaire_init, output_dir=self.PATH_DESTINATION)
        init_principale_file.add_mn_lines(init_principale.bloc)
        init_principale_file.build_file()
            
    def gst_register(self):
        
        for programme in self.liste_programme:

            # Création du nom du sous programme d'init
            stem_prog_init = f"{self.config.prefixe_init}{programme.stem}"
           
            # Création de l'objet parser
            sub_obj = LSFileFilter()

            # Extraction des lignes MN
            mn_lines = sub_obj.keep_mn(programme, rule=False)

            # Récupération de la dernière valeur du registre
            last_value = sub_obj.get_last_r_value(mn_lines, self.config.register_programme)
                    
            # Vérifie la conformité du programme
            if last_value is None:
                self.console.warning(f"{programme.name} : absence de registre programme")
                print(f"{programme.name} : absence de registre programme")
                if self.config.abort_on_missing_argument:
                    continue
                last_value = 0
                self.liste_nom_programme.append(stem_prog_init)
                self.liste_value_register_programme.append(last_value)
            else:
                last_value = int(last_value)
                self.liste_nom_programme.append(stem_prog_init)
                self.liste_value_register_programme.append(last_value)
            
            # Création de l'objet parser
            obj = LSFileFilter(register_number=self.config.register_init, rules_calcul=self.liste_calcul, rules_pince=self.liste_pince)
                    
            # Création du sous programme init
            obj1 = InitGenerator(f"{programme.name}", self.config.alarme_value, prefixe_init=self.config.prefixe_init, memo_positon=self.config.register_init)

            # Tri des lignes MN et POS du programme d'origine
            pos_lines = obj.keep_pos(programme)

            # Edition des registres d'init sur les lignes MN triées
            mn_lines = obj.keep_mn(programme, rule=False)
            obj2 = LSFileEditer(programme)
            mn_lines = obj2.overwrite_mn_memo(mn_lines, self.config.register_init, self.liste_pince)
            obj2.overwrite_mn(mn_lines)
            
            # Extraction des lignes MN
            mn_lines = obj.keep_mn(programme)
            liste_bloc, liste_valeur_registre, liste_offset = obj.extract_blocks_table(mn_lines)
            
            # Construction finales de la section MN
            obj1.start_sub_main_register()
            obj1.structure_select_half_sub_main(liste_valeur_registre)
            obj1.structure_select_sub_main(liste_valeur_registre, liste_offset)
            for i, bloc in enumerate(liste_bloc):
                obj1.structure_indiv(i+1, bloc)
            obj1.end_sub_main_register()

            # Construction du sous programme d'init
            obj3 = LSFileBuilder(
                name=stem_prog_init,
                comment=self.config.commentaire_init,
                output_dir=self.PATH_DESTINATION
            )
            obj3.add_mn_lines(obj1.bloc)
            obj3.add_pos_lines(pos_lines)
            obj3.build_file()

        init_principale = InitGenerator(self.config.project_name, self.config.alarme_value, self.config.prefixe_init, memo_positon=self.config.register_programme)

        init_principale.structure_select_main_register(
            self.liste_value_register_programme,
            self.liste_nom_programme
        )
        init_principale.end_main_register(self.config.is_gst_rebut, 
                                          self.config.is_gst_prehenseur, 
                                          self.config.programme_rebut, 
                                          self.config.programme_prehenseur, 
                                          self.config.register_prehenseur)

        init_principale_file = LSFileBuilder(name=f"{self.config.prefixe_init}{self.config.main_name}", comment=self.config.commentaire_init, output_dir=self.PATH_DESTINATION)
        init_principale_file.add_mn_lines(init_principale.bloc)
        init_principale_file.build_file()
        
    def main(self):

        PATH_SOURCE, PATH_CALCUL, PATH_PINCE, self.PATH_DESTINATION, PATH_EDIT = create_folders_gen_init(self.config.PATH_GLOBAL)

        # Copie le dossier source
        shutil.rmtree(PATH_EDIT, ignore_errors=True)
        shutil.copytree(PATH_SOURCE, PATH_EDIT)

        # Renomer fichiers en majuscules
        for root, _, files in os.walk(PATH_EDIT):
            for file in files:
                os.rename(
                    os.path.join(root, file),
                    os.path.join(root, file.upper())
                )

        # Récupération des fichiers
        self.liste_programme = get_fichiers(PATH_EDIT, root=True)
        self.liste_calcul = get_fichiers(PATH_CALCUL)
        self.liste_pince = get_fichiers(PATH_PINCE)
        
        if self.config.is_gst_dido:
            self.gst_dido()
        elif self.config.is_gst_register:
            self.gst_register()

        
class EditInit:
    def __init__(self, config : EditInitConfig, console=None):
        self.config = config
        self.console = console

        self.main()

    def main(self):
        """
        
        """
        normalize_extensions(self.config.PATH_SOURCE)
        liste_source = get_fichiers(self.config.PATH_SOURCE, root=True)

        normalize_extensions(self.config.PATH_INIT)
        liste_init = get_fichiers(self.config.PATH_INIT, root=True)

        # Vérification du nombre
        if len(liste_source) != len(liste_init):
            raise ValueError(
                f"Nombre de fichiers différent : "
                f"{len(liste_source)} source(s) / {len(liste_init)} init(s)"
            )

        # Vérification des correspondances
        fichiers_init = {f.name for f in liste_init}

        for programme in liste_source:
            expected_name = f"{self.config.prefixe_init}{programme.name}"

            if expected_name not in fichiers_init:
                raise FileNotFoundError(
                    f"Fichier INIT manquant pour {programme.name} "
                    f"(attendu : {expected_name})"
                )

        # Traitement
        for programme in liste_source:
            obj = LSFileFilter(66)

            pos_lines = obj.keep_pos(programme)

            file_init = self.config.PATH_INIT / f"{self.config.prefixe_init}{programme.name}"

            obj1 = LSFileEditer(file_init)
            obj1.overwrite_pos(pos_lines)

