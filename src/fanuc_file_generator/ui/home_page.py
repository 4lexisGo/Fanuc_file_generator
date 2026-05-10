import customtkinter as ctk
from fanuc_file_generator.ui.dialogs import select_folder


# =========================
# CONFIGURATION APP
# =========================
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")


class App(ctk.CTk):

    def __init__(self):
        super().__init__()

        # Fenêtre
        self.title("Sélection des dossiers")
        self.geometry("900x500")
        self.minsize(800, 450)

        # Grid principale
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=1)

        # Frame principale
        self.main_frame = ctk.CTkFrame(
            self,
            corner_radius=20
        )
        self.main_frame.grid(
            row=0,
            column=0,
            padx=20,
            pady=20,
            sticky="nsew"
        )

        self.main_frame.grid_columnconfigure(1, weight=1)

        # =========================
        # TITRE
        # =========================
        title = ctk.CTkLabel(
            self.main_frame,
            text="Configuration des dossiers",
            font=ctk.CTkFont(size=28, weight="bold")
        )
        title.grid(
            row=0,
            column=0,
            columnspan=3,
            padx=20,
            pady=(25, 35),
            sticky="w"
        )

        # =========================
        # CHAMPS DOSSIERS
        # =========================
        self.create_folder_selector(
            row=1,
            label_text="Dossier de Programmes principaux",
            attr_name="entry_programmes_principaux"
        )

        self.create_folder_selector(
            row=2,
            label_text="Dossier de Programmes sorties",
            attr_name="entry_programmes_sorties"
        )

        self.create_folder_selector(
            row=3,
            label_text="Dossier de Programmes mouvement pince",
            attr_name="entry_programmes_pince"
        )

        self.create_folder_selector(
            row=4,
            label_text="Dossier de Reserves",
            attr_name="entry_reserves"
        )

        # =========================
        # BOUTON VALIDATION
        # =========================
        self.btn_validate = ctk.CTkButton(
            self.main_frame,
            text="Valider",
            height=45,
            font=ctk.CTkFont(size=16, weight="bold"),
            command=self.validate
        )

        self.btn_validate.grid(
            row=5,
            column=0,
            columnspan=3,
            padx=20,
            pady=(40, 25),
            sticky="ew"
        )

    # =========================
    # CREATION LIGNE DOSSIER
    # =========================
    def create_folder_selector(self, row, label_text, attr_name):

        label = ctk.CTkLabel(
            self.main_frame,
            text=label_text,
            font=ctk.CTkFont(size=15)
        )

        label.grid(
            row=row,
            column=0,
            padx=(20, 10),
            pady=12,
            sticky="w"
        )

        entry = ctk.CTkEntry(
            self.main_frame,
            height=40,
            font=ctk.CTkFont(size=14)
        )

        entry.grid(
            row=row,
            column=1,
            padx=10,
            pady=12,
            sticky="ew"
        )

        setattr(self, attr_name, entry)

        button = ctk.CTkButton(
            self.main_frame,
            text="Parcourir",
            width=120,
            height=40,
            command=lambda e=entry: select_folder(e)
        )

        button.grid(
            row=row,
            column=2,
            padx=(10, 20),
            pady=12
        )

    # =========================
    # VALIDATION
    # =========================
    def validate(self):

        print("\n===== DOSSIERS SELECTIONNES =====")

        print("Programmes principaux :")
        print(self.entry_programmes_principaux.get())

        print("\nProgrammes sorties :")
        print(self.entry_programmes_sorties.get())

        print("\nProgrammes mouvement pince :")
        print(self.entry_programmes_pince.get())

        print("\nReserves :")
        print(self.entry_reserves.get())


# =========================
# LANCEMENT
# =========================
if __name__ == "__main__":

    app = App()
    app.mainloop()
    
# Liste des programmes de mouvement (génération programmes init)
#   - registre memo programme en cours

# Liste des regles de keep_mn
#   - type de mouvement (J, L, C...)
#   - registre memo init
#   - position registre
#   - programme de calcul
#   - programme de controle pince





