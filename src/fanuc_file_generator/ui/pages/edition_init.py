from fanuc_file_generator.ui.utils import add_folder, labeled_entry
from fanuc_file_generator.fold.test_init import EditInit
from fanuc_file_generator.utils.config_data import EditInitConfig

from pathlib import Path
import customtkinter as ctk


class EditionInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app

        # GRID ROOT
        self.grid_rowconfigure(0, weight=0)
        self.grid_rowconfigure(1, weight=1)

        # TITLE
        ctk.CTkLabel(
            self,
            text="Édition INIT",
            font=ctk.CTkFont(size=22, weight="bold")
        ).grid(row=0, column=0, sticky="w", padx=10, pady=20)

        # MAIN FORM
        self.form = ctk.CTkFrame(self)
        self.form.grid(row=1, column=0, sticky="nsew", padx=10, pady=10)

        self.grid_columnconfigure(0, weight=1)
        self.nb_cols = self.form.grid_size()[0]

        row = 0
        self._build_main_section(self.form, row)
        row += 1
        self._build_footer_section(self.form, row)
        row += 1
    
    def _build_footer_section(self, parent, global_row):
        self.footer = ctk.CTkFrame(parent)
        self.footer.grid(row=global_row, column=0, sticky="ew", padx=10, pady=10)

        self.footer.grid_columnconfigure(0, weight=1)

        self.validate_button = ctk.CTkButton(
            self.footer,
            text="Editer",
            command=self._run_edit
        )
        self.validate_button.grid(row=0, column=0, sticky="ew")

    def _build_main_section(self, parent, global_row):
        self.main_frame = ctk.CTkFrame(parent)
        self.main_frame.grid(row=global_row, column=0, sticky="nsew", padx=10, pady=10)

        row = 0
        self.dir1 = add_folder(self.main_frame, row, "Dossier SOURCE")
        row += 1
        self.dir2 = add_folder(self.main_frame, row, "Dossier INIT")
        row += 1
        self.prefixe = labeled_entry(self.main_frame, row, "prefixe")
        row += 1

    def _build_config(self):
        
        return EditInitConfig(
            PATH_SOURCE=Path(self.dir1.get()),
            PATH_INIT=Path(self.dir2.get()),
            prefixe_init=self.prefixe.get()
        )

    def _run_edit(self):

        self.app.console.log("Début édition INIT...")
        
        EditInit(self._build_config())

        self.app.console.log("Édition terminée avec succès")

