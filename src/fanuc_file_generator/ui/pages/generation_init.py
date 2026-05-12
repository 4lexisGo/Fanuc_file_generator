import customtkinter as ctk
from fanuc_file_generator.ui.dialogs import select_folder


class GenerationInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app

        self.grid_columnconfigure(1, weight=1)

        ctk.CTkLabel(self, text="Génération INIT", font=ctk.CTkFont(size=22, weight="bold")).grid(
            row=0, column=0, columnspan=3, pady=20, sticky="w"
        )

        # =====================
        # 4 DOSSIERS
        # =====================
        self.entries = {}

        folders = [
            "Dossier 1",
            "Dossier 2",
            "Dossier 3",
            "Dossier 4"
        ]

        for i, name in enumerate(folders):
            self._add_folder(i + 1, name)

        # =====================
        # 2 STRINGS
        # =====================
        self.str1 = self._add_entry(5, "String 1")
        self.str2 = self._add_entry(6, "String 2")

        # =====================
        # 5 INT
        # =====================
        self.ints = []
        for i in range(5):
            self.ints.append(self._add_entry(7 + i, f"Int {i+1}"))

        # =====================
        # BUTTON
        # =====================
        ctk.CTkButton(self, text="Valider génération", command=self.validate).grid(
            row=12, column=0, columnspan=3, pady=20, sticky="ew"
        )

    def _add_folder(self, row, label):
        ctk.CTkLabel(self, text=label).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        entry = ctk.CTkEntry(self)
        entry.grid(row=row, column=1, sticky="ew", padx=10)

        ctk.CTkButton(
            self,
            text="...",
            width=60,
            command=lambda e=entry: select_folder(e)
        ).grid(row=row, column=2)

        self.entries[label] = entry

    def _add_entry(self, row, label):
        ctk.CTkLabel(self, text=label).grid(row=row, column=0, sticky="w", padx=10, pady=5)

        entry = ctk.CTkEntry(self)
        entry.grid(row=row, column=1, columnspan=2, sticky="ew", padx=10)

        return entry

    def validate(self):
        app = self.app
        app.log("=== Génération INIT ===")

        # check dossiers
        for k, e in self.entries.items():
            if not e.get():
                app.log(f"[ERROR] Dossier manquant: {k}")

        # strings
        if not self.str1.get():
            app.log("[ERROR] String 1 vide")
        if not self.str2.get():
            app.log("[ERROR] String 2 vide")

        # ints
        for i, e in enumerate(self.ints):
            try:
                int(e.get())
            except:
                app.log(f"[ERROR] Int {i+1} invalide")