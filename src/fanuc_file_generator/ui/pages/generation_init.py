from fanuc_file_generator.ui.utils import add_folder, labeled_entry, toggle_frame
from fanuc_file_generator.utils.config_data import GenInitConfig
from fanuc_file_generator.fold.test_init import GenInit

import customtkinter as ctk
from CTkToolTip import CTkToolTip
from pathlib import Path

import re


class GenerationInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app

        # GRID ROOT
        self.grid_rowconfigure(0, weight=0)
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)

        # TITLE
        ctk.CTkLabel(
            self,
            text="Génération INIT",
            font=ctk.CTkFont(size=22, weight="bold")
        ).grid(row=0, column=0, sticky="w", padx=10, pady=20)

        # MAIN FORM
        self.form = ctk.CTkFrame(self)
        self.form.grid(row=1, column=0, sticky="nsew", padx=10, pady=10)

        self.form.grid_columnconfigure(0, weight=1, uniform="cols")
        self.form.grid_columnconfigure(1, weight=1, uniform="cols")

        self.nb_cols = self.form.grid_size()[0]

        row = 0
        self._build_general_section(self.form, row)
        row += 1
        self._build_prehenseur_section(self.form, row)
        self._build_rebut_section(self.form, row)
        row += 1
        self._build_settings_section(self.form, row)
        self._build_type_section(self.form, row)
        row += 1
        self._build_footer_section(self.form, row)
        
        self._edit_values()

    
    def _build_footer_section(self, parent, global_row):
        self.footer = ctk.CTkFrame(parent)
        self.footer.grid(row=global_row, column=0, columnspan=self.nb_cols, sticky="ew", padx=10, pady=10)

        self.footer.grid_columnconfigure(0, weight=1)

        self.validate_button = ctk.CTkButton(
            self.footer,
            text="Générer",
            command=self._run_generation
        )
        self.validate_button.grid(row=0, column=0, sticky="ew")

    def _build_general_section(self, parent, global_row):

        self.general_frame = ctk.CTkFrame(parent)
        self.general_frame.grid(row=global_row, column=0, columnspan=self.nb_cols, sticky="ew", padx=10, pady=10)

        self.general_frame.grid_columnconfigure(1, weight=1)

        row = 0
        self.path_global = add_folder(self.general_frame, row, "Dossier de travail")
        row += 1
        self.project_name = labeled_entry(self.general_frame, row, "Nom du projet", columnspan_entry=2)
        CTkToolTip(self.project_name,
            message="Nom du client ou identifiant projet"
        )
        row += 1
        self.main_name = labeled_entry(self.general_frame, row, "Nom du programme principale", columnspan_entry=2)
        row += 1
        self.prefixe_init = labeled_entry(self.general_frame, row, "Préfixe des programmes d'init", columnspan_entry=2)
        CTkToolTip(self.prefixe_init,
            message="Chaine de caractères placée avant le nom du programme source pour former le nom du programme d'init correspondant.\nExemple : préfixe = 'INIT_' => programme source 'SAB01_10' => programme d'init 'INIT_SAB01_10'"
        )
        row += 1
        self.commentaire_init = labeled_entry(self.general_frame, row, "Commentaire des programmes d'init", columnspan_entry=2)

    def _build_settings_section(self, parent, global_row):
        self.settings_frame = ctk.CTkFrame(parent)
        self.settings_frame.grid(row=global_row, column=0, sticky="ew", padx=10, pady=10)

        self.settings_frame.grid_columnconfigure(1, weight=1)

        row = 0
        self.register_position = labeled_entry(self.settings_frame, row, "Registre mémorisation de la position")
        row += 1
        self.alarme_value = labeled_entry(self.settings_frame, row, "Valeur de l'alarme pour GO[1]")
        row += 1
        self.speed_linear = labeled_entry(self.settings_frame, row, "Vitesse linéaire (mm/s)")
        row += 1
        self.speed_joint = labeled_entry(self.settings_frame, row, "Vitesse articulaire (%)")
        row += 1

        # CHECKBOX
        self.abort_on_missing_argument_enabled = ctk.BooleanVar(value=False)

        self.abort_on_missing_argument = ctk.CTkCheckBox(
            self.settings_frame,
            text="Arrêt si R ou D manquant",
            variable=self.abort_on_missing_argument_enabled
        )
        self.abort_on_missing_argument.grid(row=row, column=0, sticky="w", padx=10, pady=5)

    def _build_prehenseur_section(self, parent, global_row):

        # FRAME PRINCIPALE
        self.prehenseur_frame = ctk.CTkFrame(parent)
        self.prehenseur_frame.grid(row=global_row, column=0, sticky="ew", padx=10, pady=10)
        self.prehenseur_frame.grid_columnconfigure(0, weight=1)

        # CHECKBOX
        self.prehenseur_enabled = ctk.BooleanVar(value=False)
        self.prehenseur_checkbox = ctk.CTkCheckBox(
            self.prehenseur_frame,
            text="Gestion préhenseur",
            variable=self.prehenseur_enabled,
            command=lambda: toggle_frame(self.prehenseur_enabled.get(), self.prehenseur_subframe)
        )
        self.prehenseur_checkbox.grid(row=0, column=0, sticky="w", padx=10, pady=5)

        # SOUS-FRAME (contenu toggle)
        self.prehenseur_subframe = ctk.CTkFrame(self.prehenseur_frame)
        self.prehenseur_subframe.grid(row=1, column=0, sticky="ew", padx=10, pady=5)
        self.prehenseur_subframe.grid_columnconfigure(1, weight=1)

        # caché par défaut
        self.prehenseur_subframe.grid_remove()

        # Champs
        row = 0

        self.programme_prehenseur = labeled_entry(
            self.prehenseur_subframe,
            row,
            "Programme préhenseur"
        )
        row += 1

        self.register_prehenseur = labeled_entry(
            self.prehenseur_subframe,
            row,
            "Registre de demande de changement"
        )

    def _build_rebut_section(self, parent, global_row):

        self.rebut_frame = ctk.CTkFrame(parent)
        self.rebut_frame.grid(row=global_row, column=1, sticky="ew", padx=10, pady=10)
        self.rebut_frame.grid_columnconfigure(0, weight=1)

        # CHECKBOX
        self.rebut_enabled = ctk.BooleanVar(value=False)
        self.rebut_checkbox = ctk.CTkCheckBox(
            self.rebut_frame,
            text="Gestion rebut",
            variable=self.rebut_enabled,
            command=lambda: toggle_frame(self.rebut_enabled.get(), self.rebut_subframe)
        )
        self.rebut_checkbox.grid(row=0, column=0, sticky="w", padx=10, pady=5)

        # SOUS-FRAME (contenu toggle)
        self.rebut_subframe = ctk.CTkFrame(self.rebut_frame)
        self.rebut_subframe.grid(row=1, column=0, sticky="ew", padx=10, pady=5)
        self.rebut_subframe.grid_columnconfigure(1, weight=1)

        # caché par défaut
        self.rebut_subframe.grid_remove()

        # Champs
        row = 0
        self.programme_rebut = labeled_entry(self.rebut_subframe, row, "Programme de rebut")

        CTkToolTip(
            self.programme_rebut,
            message="Programme de gestion des pièces rebut, ne pas mettre l'extension"
        )
        row += 1

    def _build_type_section(self, parent, global_row):

        self.type_frame = ctk.CTkFrame(parent)
        self.type_frame.grid(row=global_row, column=1, sticky="ew", padx=10, pady=10)
        self.type_frame.grid_columnconfigure(1, weight=1)

        row = 0

        ctk.CTkLabel(
            self.type_frame,
            text="Type de sélection pour l'init"
        ).grid(row=row, column=0, sticky="w", padx=10)

        self.type_selection = ctk.CTkComboBox(
            self.type_frame,
            values=["DI/DO", "Registre"],
            state="readonly",
            command=self._on_type_changed
        )
        self.type_selection.grid(
            row=row, column=1, sticky="ew", padx=10, pady=5
        )
        row += 1
        
        # Frames conditionnels
        self.registre_frame = ctk.CTkFrame(self.type_frame)
        self.dido_frame = ctk.CTkFrame(self.type_frame)

        self._build_registre_frame()
        self._build_dido_frame()

        self.type_selection.set("DI/DO")

        self.registre_frame.grid_remove()
        self.dido_frame.grid_remove()

        self._on_type_changed("DI/DO")

    def _build_registre_frame(self):
        self.registre_frame.grid_columnconfigure(1, weight=1)

        row = 0
        self.register_programme = labeled_entry(self.registre_frame, row, "Registre de sélection de programme")

    def _build_dido_frame(self):
        self.dido_frame.grid_columnconfigure(1, weight=1)

        row = 0
        self.do_start = labeled_entry(self.dido_frame, row, "DO Start")
        row += 1
        
        # CHECKBOX
        self.alternated_do_value_enabled = ctk.BooleanVar(value=True)
        self.alternated_do_value_checkbox = ctk.CTkCheckBox(
            self.dido_frame,
            text="Valeur alternée pour DO",
            variable=self.alternated_do_value_enabled
        )
        self.alternated_do_value_checkbox.grid(row=row, column=0, columnspan=2, sticky="w", padx=10, pady=5)
        CTkToolTip(
            self.alternated_do_value_checkbox,
            message="DO[1:en cours], DO[2:fin], DO[3:en cours], DO[4:fin], etc ..."
        )
        row += 1

        ctk.CTkLabel(
            self.dido_frame,
            text="Méthode de définition de DI"
        ).grid(row=row, column=0, sticky="w", padx=10)

        self.methode_selection = ctk.CTkComboBox(
            self.dido_frame,
            values=["Start-Stop", "Liste"],
            state="readonly",
            command=self._on_methode_changed
        )
        self.methode_selection.grid(
            row=row, column=1, sticky="ew", padx=10, pady=5
        )
        row += 1

        # Frames conditionnels
        self.di_start_stop_frame = ctk.CTkFrame(self.dido_frame)
        self.di_liste_frame = ctk.CTkFrame(self.dido_frame)
        
        self._build_liste_di(row)
        self._build_start_stop_di(row)

        self.methode_selection.set("Start-Stop")

        self.di_start_stop_frame.grid_remove()
        self.di_liste_frame.grid_remove()

        self._on_methode_changed("Start-Stop")

    def _build_start_stop_di(self, row):
        self.di_start_stop_frame.grid_columnconfigure(1, weight=1)
        self.di_start = labeled_entry(self.di_start_stop_frame, row, "DI Start")
        row += 1
        self.di_stop = labeled_entry(self.di_start_stop_frame, row, "DI Stop")

    def _build_liste_di(self, row):
        self.di_liste_frame.grid_columnconfigure(1, weight=1)
        self.di_liste_raw = labeled_entry(self.di_liste_frame, row, "Liste de DI")
        
    def _edit_values(self):
        self.main_name.insert(0, "SAB01")
        self.prefixe_init.insert(0, "INIT_")
        self.commentaire_init.insert(0, "Génération automatique")
        self.speed_linear.insert(0, "100")
        self.speed_joint.insert(0, "10")

    def _build_config(self):
        
        if self.type_selection.get() == "DI/DO":
            self.dido_enabled = True
            is_di_start_stop = True if self.methode_selection == "Start-Stop" else False
            is_di_liste = True if self.methode_selection == "Liste" else False
        else :
            is_di_start_stop = False
            self.dido_enabled = False
            is_di_liste = False

        di_liste = []
        if is_di_liste:
            for x in re.split(r"[.,;:|\s]+", self.di_liste_raw.strip()):
                if not x:
                    continue

                di_liste.append(int(x))

        self.registre_enabled = True if self.type_selection.get() == "Registre" else False
        
        return GenInitConfig(
            PATH_GLOBAL=Path(self.path_global.get()),

            project_name=self.project_name.get(),
            main_name=self.main_name.get(),
            prefixe_init=self.prefixe_init.get(),
            commentaire_init=self.commentaire_init.get(),

            register_init=int(self.register_position.get()),
            alarme_value=int(self.alarme_value.get()),
            speed_linear=int(self.speed_linear.get()),
            speed_joint=int(self.speed_joint.get()),
            abort_on_missing_argument=self.abort_on_missing_argument_enabled.get(),

            is_gst_prehenseur=self.prehenseur_enabled.get(),
            programme_prehenseur=self.programme_prehenseur.get() if self.prehenseur_enabled.get() else None,
            register_prehenseur=int(self.register_prehenseur.get()) if self.prehenseur_enabled.get() else None,
            
            is_gst_rebut=self.rebut_enabled.get(),
            programme_rebut=self.programme_rebut.get() if self.rebut_enabled.get() else None,
            
            is_gst_dido=self.dido_enabled,
            do_start=int(self.do_start.get()) if self.dido_enabled else None,
            is_alternated_do_value=self.alternated_do_value_enabled.get(),
            is_di_start_stop=is_di_start_stop,
            di_start=int(self.di_start.get()) if self.dido_enabled else None,
            di_stop=int(self.di_stop.get()) if self.dido_enabled else None,
            is_di_liste=is_di_liste,
            di_liste=di_liste if is_di_liste else None,
            
            is_gst_register=self.registre_enabled,
            register_programme=int(self.register_programme.get()) if self.registre_enabled else None
        )
    
    # UI HELPERS
    def _on_type_changed(self, value=None):
        value = value or self.type_selection.get()

        self.registre_frame.grid_remove()
        self.dido_frame.grid_remove()

        if value == "Registre":
            self.registre_frame.grid(
                columnspan=2,
                sticky="ew",
                padx=10,
                pady=5
            )
        elif value == "DI/DO":
            self.dido_frame.grid(
                columnspan=2,
                sticky="ew",
                padx=10,
                pady=5
            )

    def _on_methode_changed(self, value=None):
        value = value or self.methode_selection.get()

        self.di_start_stop_frame.grid_remove()
        self.di_liste_frame.grid_remove()

        if value == "Start-Stop":
            self.di_start_stop_frame.grid(
                columnspan=2,
                sticky="ew",
                padx=10,
                pady=5
            )
        elif value == "Liste":
            self.di_liste_frame.grid(
                columnspan=2,
                sticky="ew",
                padx=10,
                pady=5
            )

    def _run_generation(self):

        self.app.console.log("Début génération INIT...")

        GenInit(self._build_config())

        self.app.console.log("Génération terminée avec succès")