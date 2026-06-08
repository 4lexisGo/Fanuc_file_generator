import customtkinter as ctk
from fanuc_file_generator.ui.pages.generation_init import GenerationInitPage
from fanuc_file_generator.ui.pages.edition_init import EditionInitPage
from fanuc_file_generator.ui.widgets.console import Console
from fanuc_file_generator.utils.file import resource_path


ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")


class App(ctk.CTk):

    def __init__(self):
        super().__init__()

        self.title("Configuration INIT")
        self.iconbitmap(resource_path("assets/sab_robotique.ico"))
        
        # Affichage en plein écran
        try:
            self.attributes("-fullscreen", True)
        except:
            self.state("zoomed")
        self.bind("<Escape>", self.attributes("-fullscreen", False))

        # layout global
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)

        # MENU
        self.menu_frame = ctk.CTkFrame(self)
        self.menu_frame.grid(row=0, column=0, sticky="ew")

        ctk.CTkButton(
            self.menu_frame,
            text="Génération INIT",
            command=self.show_generation
        ).pack(side="left", padx=10, pady=10)

        ctk.CTkButton(
            self.menu_frame,
            text="Édition INIT",
            command=self.show_edition
        ).pack(side="left", padx=10, pady=10)

        # CONTAINER PAGES
        self.container = ctk.CTkFrame(self)
        self.container.grid(row=1, column=0, sticky="nsew")

        self.container.grid_rowconfigure(0, weight=1)
        self.container.grid_columnconfigure(0, weight=1)

        # CONSOLE
        self.console = Console(self)
        self.console.grid(row=2, column=0, sticky="ew")

        # pages
        self.pages = {}

        self.pages["gen"] = GenerationInitPage(self.container, self)
        self.pages["edit"] = EditionInitPage(self.container, self)

        self.show_generation()

    def show_generation(self):
        self._show("gen")

    def show_edition(self):
        self._show("edit")

    def _show(self, name):
        for p in self.pages.values():
            p.grid_forget()

        self.pages[name].grid(row=0, column=0, sticky="nsew")


if __name__ == "__main__":
    app = App()
    app.mainloop()