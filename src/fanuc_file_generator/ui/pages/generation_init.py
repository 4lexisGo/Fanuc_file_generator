from fanuc_file_generator.ui.dialogs import select_folder
from fanuc_file_generator.fold.test_init import main as main_init
from fanuc_file_generator.utils.file import resource_path

import customtkinter as ctk
import json
from pathlib import Path


class GenerationInitPage(ctk.CTkFrame):

    def __init__(self, parent, app):
        super().__init__(parent)
        self.app = app
        
        self.CONFIG_FILE = Path(resource_path("assets/config_user.json"))

        # =====================
        # GRID STRUCTURE (IMPORTANT FIX)
        # =====================
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)
        self.grid_columnconfigure(2, weight=0)

        self.grid_rowconfigure(0, weight=0)  # title
        self.grid_rowconfigure(1, weight=1)  # form
        self.grid_rowconfigure(2, weight=0)  # console

        # =====================
        # TITLE
        # =====================
        ctk.CTkLabel(
            self,
            text="Génération INIT",
            font=ctk.CTkFont(size=22, weight="bold")
        ).grid(row=0, column=0, columnspan=3, pady=20, sticky="w")

        # =====================
        # FORM FRAME (IMPORTANT)
        # =====================
        self.form = ctk.CTkFrame(self)
        self.form.grid(row=1, column=0, columnspan=3, sticky="nsew", padx=10)
        self.form.grid_columnconfigure(1, weight=1)

        # =====================
        # PATH GLOBAL
        # =====================
        ctk.CTkLabel(self.form, text="PATH_GLOBAL").grid(row=0, column=0, sticky="w", padx=10, pady=5)

        self.path_global = ctk.CTkEntry(self.form)
        self.path_global.grid(row=0, column=1, sticky="ew", padx=10)

        ctk.CTkButton(
            self.form,
            text="...",
            width=60,
            command=lambda: select_folder(self.path_global)
        ).grid(row=0, column=2)

        # =====================
        # STRINGS
        # =====================
        self.project_name = self._entry(1, "project_name")
        self.main_name = self._entry(2, "main_name")
        self.name_init = self._entry(3, "name_init")

        self.str1 = self._entry(4, "programme_prehenseur")
        self.str2 = self._entry(5, "programme_rebut")
        self.commentaire = self._entry(6, "commentaire_init")

        # =====================
        # INTS
        # =====================
        labels = [
            "memo_programme",
            "memo_init",
            "numero_alarme",
            "memo_piece",
            "memo_prehenseur"
        ]

        self.ints = []
        for i, name in enumerate(labels):
            self.ints.append(self._entry(7 + i, name))

        # =====================
        # BUTTON
        # =====================
        ctk.CTkButton(
            self.form,
            text="Valider génération",
            command=self.validate
        ).grid(row=13, column=0, columnspan=3, pady=20, sticky="ew")

        # =====================
        # CONFIG
        # =====================
        self.ensure_config_exists()
        self.load_previous_values()

    # =========================================================
    # UI HELPERS
    # =========================================================

    def _entry(self, row, label):
        ctk.CTkLabel(self.form, text=label).grid(
            row=row, column=0, sticky="w", padx=10, pady=5
        )

        e = ctk.CTkEntry(self.form)
        e.grid(row=row, column=1, columnspan=2, sticky="ew", padx=10)
        return e

    # =========================================================
    # CONFIG
    # =========================================================

    def ensure_config_exists(self):
        if self.CONFIG_FILE.exists():
            return

        default = {
            "PATH_GLOBAL": "",

            "project_name": "FAIVELAY",
            "main_name": "SAB01",
            "name_init": "INIT_",

            "programme_prehenseur": "CHANG_OUTIL",
            "programme_rebut": "REBUT",
            "commentaire_init": "Génération auto",

            "memo_programme": 30,
            "memo_init": 31,
            "numero_alarme": 32,
            "memo_piece": 99,
            "memo_prehenseur": 98
        }

        with open(self.CONFIG_FILE, "w", encoding="utf-8") as f:
            json.dump(default, f, indent=4, ensure_ascii=False)

    def load_config(self):
        self.ensure_config_exists()
        with open(self.CONFIG_FILE, "r", encoding="utf-8") as f:
            return json.load(f)

    def save_config(self, data):
        with open(self.CONFIG_FILE, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=4, ensure_ascii=False)

    def load_previous_values(self):
        data = self.load_config()

        def set(e, v):
            e.delete(0, "end")
            e.insert(0, str(v))

        set(self.path_global, data["PATH_GLOBAL"])
        set(self.project_name, data["project_name"])
        set(self.main_name, data["main_name"])
        set(self.name_init, data["name_init"])

        set(self.str1, data["programme_prehenseur"])
        set(self.str2, data["programme_rebut"])
        set(self.commentaire, data["commentaire_init"])

        keys = [
            "memo_programme",
            "memo_init",
            "numero_alarme",
            "memo_piece",
            "memo_prehenseur"
        ]

        for i, e in enumerate(self.ints):
            set(e, data[keys[i]])

    # =========================================================
    # VALIDATION
    # =========================================================

    def validate(self):

        def error(msg):
            self.console.insert("end", f"[ERROR] {msg}\n")
            self.console.see("end")
            return None

        # PATH
        path_global = Path(self.path_global.get())
        if not path_global.exists():
            return error("PATH_GLOBAL invalide")

        # STR
        def check_str(v, name):
            if not v:
                return error(f"{name} vide")
            return v.strip()

        project_name = check_str(self.project_name.get(), "project_name")
        main_name = check_str(self.main_name.get(), "main_name")
        name_init = check_str(self.name_init.get(), "name_init")

        programme_prehenseur = check_str(self.str1.get(), "programme_prehenseur")
        programme_rebut = check_str(self.str2.get(), "programme_rebut")
        commentaire_init = check_str(self.commentaire.get(), "commentaire_init")

        # INT
        def check_int(e, name):
            try:
                return int(e.get())
            except:
                return error(f"{name} invalide")

        memo_programme = check_int(self.ints[0], "memo_programme")
        memo_init = check_int(self.ints[1], "memo_init")
        numero_alarme = check_int(self.ints[2], "numero_alarme")
        memo_piece = check_int(self.ints[3], "memo_piece")
        memo_prehenseur = check_int(self.ints[4], "memo_prehenseur")

        if None in [memo_programme, memo_init, numero_alarme, memo_piece, memo_prehenseur]:
            return

        # SAVE
        self.save_config({
            "PATH_GLOBAL": str(path_global),

            "project_name": project_name,
            "main_name": main_name,
            "name_init": name_init,

            "programme_prehenseur": programme_prehenseur,
            "programme_rebut": programme_rebut,
            "commentaire_init": commentaire_init,

            "memo_programme": memo_programme,
            "memo_init": memo_init,
            "numero_alarme": numero_alarme,
            "memo_piece": memo_piece,
            "memo_prehenseur": memo_prehenseur
        })

        # CALL
        main_init(
            memo_programme,
            memo_init,
            numero_alarme,
            memo_piece,
            memo_prehenseur,
            programme_prehenseur,
            programme_rebut,
            project_name,
            main_name,
            name_init,
            commentaire_init,
            path_global
        )