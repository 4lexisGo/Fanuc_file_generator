import customtkinter as ctk
from fanuc_file_generator.ui.dialogs import select_file


class EditionInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app

        self.grid_columnconfigure(1, weight=1)

        ctk.CTkLabel(self, text="Édition INIT", font=ctk.CTkFont(size=22, weight="bold")).grid(
            row=0, column=0, columnspan=3, pady=20, sticky="w"
        )

        self.file1 = self._add_file(1, "Fichier INIT 1")
        self.file2 = self._add_file(2, "Fichier INIT 2")

        ctk.CTkButton(self, text="Valider édition", command=self.validate).grid(
            row=3, column=0, columnspan=3, pady=20, sticky="ew"
        )

    def _add_file(self, row, label):
        ctk.CTkLabel(self, text=label).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        entry = ctk.CTkEntry(self)
        entry.grid(row=row, column=1, sticky="ew", padx=10)

        ctk.CTkButton(
            self,
            text="Parcourir",
            command=lambda e=entry: select_file(e)
        ).grid(row=row, column=2)

        return entry

    def validate(self):
        app = self.app
        app.log("=== Édition INIT ===")

        if not self.file1.get():
            app.log("[ERROR] Fichier 1 manquant")

        if not self.file2.get():
            app.log("[ERROR] Fichier 2 manquant")