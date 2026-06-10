from fanuc_file_generator.ui.utils import add_folder, labeled_entry, toggle_frame
from fanuc_file_generator.utils.config_data import GenInitConfig
from fanuc_file_generator.fold.test_init import main as main_init

import customtkinter as ctk
from CTkToolTip import CTkToolTip
from pathlib import Path


class GenerationInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app

        # GRID ROOT
        self.grid_rowconfigure(0, weight=0)
        self.grid_rowconfigure(1, weight=1)

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
        print(self.form.grid_size())

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
        self.project_name = labeled_entry(self.general_frame, row, "Nom du projet")
        CTkToolTip(self.project_name,
            message="Nom du client ou identifiant projet"
        )
        row += 1
        self.main_name = labeled_entry(self.general_frame, row, "Nom du programme principale")
        row += 1
        self.prefixe_init = labeled_entry(self.general_frame, row, "Préfixe des programmes d'init")
        CTkToolTip(self.prefixe_init,
            message="Chaine de caractères placée avant le nom du programme source pour former le nom du programme d'init correspondant.\nExemple : préfixe = 'INIT_' => programme source 'PROG1' => programme d'init 'INIT_PROG1'"
        )
        row += 1

    def _build_settings_section(self, parent, global_row):
        self.settings_frame = ctk.CTkFrame(parent)
        self.settings_frame.grid(row=global_row, column=0, sticky="ew", padx=10, pady=10)

        self.settings_frame.grid_columnconfigure(1, weight=1)

        row = 0
        self.registre_sub_programme = labeled_entry(self.settings_frame, row, "Registre mémorisation de la position")
        row += 1
        self.alarme_value = labeled_entry(self.settings_frame, row, "Valeur de l'alarme")
        row += 1
        self.speed_linear = labeled_entry(self.settings_frame, row, "Vitesse linéaire")
        row += 1
        self.speed_joint = labeled_entry(self.settings_frame, row, "Vitesse articulaire")
        row += 1

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
            variable=self.prehenseur_enabled
        )
        self.prehenseur_enabled.trace_add("write", lambda *args: toggle_frame(self.prehenseur_enabled, self.prehenseur_subframe))
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

        self.registre_prehenseur = labeled_entry(
            self.prehenseur_subframe,
            row,
            "Registre de demande de changement"
        )

    def _build_rebut_section(self, parent, global_row):

        self.rebut_frame = ctk.CTkFrame(parent)
        self.rebut_frame.grid(row=global_row, column=1, sticky="ew", padx=10, pady=10)

        # CHECKBOX
        self.rebut_enabled = ctk.BooleanVar(value=False)

        self.rebut_checkbox = ctk.CTkCheckBox(
            self.rebut_frame,
            text="Gestion rebut",
            variable=self.rebut_enabled
        )
        self.rebut_enabled.trace_add("write", lambda *args: toggle_frame(self.rebut_enabled, self.rebut_subframe))
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

        ctk.CTkLabel(
            self.type_frame,
            text="Type de sélection pour l'init"
        ).grid(row=0, column=0, sticky="w", padx=10)

        self.type_selection = ctk.CTkComboBox(
            self.type_frame,
            values=["DI/DO", "Registre"],
            state="readonly",
            command=self._on_type_changed
        )
        self.type_selection.grid(
            row=1, column=0, sticky="ew", padx=10, pady=5
        )

        # frames conditionnels
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

        ctk.CTkLabel(
            self.registre_frame,
            text="Numéro du registre"
        ).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        self.registre_numero = ctk.CTkEntry(self.registre_frame)
        self.registre_numero.grid(row=row, column=1, sticky="ew", padx=10)

    def _build_dido_frame(self):
        self.dido_frame.grid_columnconfigure(1, weight=1)

        row = 0

        # DI Start
        ctk.CTkLabel(
            self.dido_frame,
            text="DI Start"
        ).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        self.di_start = ctk.CTkEntry(self.dido_frame)
        self.di_start.grid(row=row, column=1, sticky="ew", padx=10)

        row += 1

        # DI Stop
        ctk.CTkLabel(
            self.dido_frame,
            text="DI Stop"
        ).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        self.di_stop = ctk.CTkEntry(self.dido_frame)
        self.di_stop.grid(row=row, column=1, sticky="ew", padx=10)

        row += 1

        # DO Start
        ctk.CTkLabel(
            self.dido_frame,
            text="DO Start"
        ).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        self.do_start = ctk.CTkEntry(self.dido_frame)
        self.do_start.grid(row=row, column=1, sticky="ew", padx=10)

    def _build_config(self):
        
        return GenInitConfig(
            PATH_GLOBAL=Path(self.path_global.get()),

            project_name=self.project_name.get(),
            main_name=self.main_name.get(),
            prefixe_init=self.prefixe_init.get(),
            commentaire_init="",

            memo_init=self.memo_init.get(),
            alarme_value=self.alarme_value.get(),
            speed_linear=self.speed_linear.get(),
            speed_joint=self.speed_joint.get(),

            is_gst_prehenseur=self.prehenseur_enabled.get(),
            programme_prehenseur=self.programme_prehenseur.get() if self.prehenseur_enabled.get() else None,
            
            is_gst_rebut=self.rebut_enabled.get(),
            programme_rebut=self.programme_rebut.get() if self.rebut_enabled.get() else None,
            
            is_gst_dido=self.dido_enabled.get(),
            di_start=self.di_start.get() if self.dido_enabled.get() else None,
            di_end=self.di_stop.get() if self.dido_enabled.get() else None,
            do_start=self.do_start.get() if self.dido_enabled.get() else None,
            
            is_gst_registre=self.registre_enabled.get(),
            register_number=self.registre_numero.get() if self.registre_enabled.get() else None
        )
    
    # UI HELPERS
    def _on_type_changed(self, value=None):
        value = value or self.type_selection.get()

        self.registre_frame.grid_remove()
        self.dido_frame.grid_remove()

        if value == "Registre":
            self.registre_frame.grid(
                sticky="ew",
                padx=10,
                pady=5
            )
        else:
            self.dido_frame.grid(
                sticky="ew",
                padx=10,
                pady=5
            )

    def _run_generation(self):

        self.app.console.log("Début génération INIT...")

        main_init(self._build_config())

        self.app.console.log("Génération terminée avec succès")