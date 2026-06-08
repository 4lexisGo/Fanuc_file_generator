from fanuc_file_generator.fold.test_init import edit

from pathlib import Path
import customtkinter as ctk
from tkinter import filedialog

class EditionInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app

        self.grid_columnconfigure(1, weight=1)

        ctk.CTkLabel(
            self,
            text="Édition INIT",
            font=ctk.CTkFont(size=22, weight="bold")
        ).grid(row=0, column=0, columnspan=3, pady=20, sticky="w")

        self.form = ctk.CTkFrame(self)

        self.dir1 = self._add_folder(1, "Dossier SOURCE")
        self.dir2 = self._add_folder(2, "Dossier INIT")

        self.prefixe = self._entry(3, "prefixe")

        ctk.CTkButton(
            self,
            text="Valider édition",
            command=self.validate
        ).grid(row=3, column=0, columnspan=3, pady=20, sticky="ew")

    def _entry(self, row, label):
        ctk.CTkLabel(self.form, text=label).grid(
            row=row, column=0, sticky="w", padx=10, pady=5
        )

        e = ctk.CTkEntry(self.form)
        e.grid(row=row, column=1, columnspan=2, sticky="ew", padx=10)
        return e

    def _select_folder(self, entry):
        folder = filedialog.askdirectory()
        if folder:
            entry.delete(0, "end")
            entry.insert(0, folder)

    def _add_folder(self, row, label):
        ctk.CTkLabel(self, text=label).grid(
            row=row,
            column=0,
            sticky="w",
            padx=10,
            pady=5
        )

        entry = ctk.CTkEntry(self)
        entry.grid(row=row, column=1, sticky="ew", padx=10)

        ctk.CTkButton(
            self,
            text="Parcourir",
            command=lambda e=entry: self._select_folder(e)
        ).grid(row=row, column=2)

        return entry

    def validate(self):
        app = self.app
        
        # STR
        def check_str(v, name):
            return v.strip()

        dir1 = Path(self.dir1.get())
        
        dir2 = Path(self.dir2.get())
            
        prefixe = check_str(self.prefixe.get(), "prefixe")

        edit(dir1, dir2, prefixe)