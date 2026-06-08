import customtkinter as ctk


class Console(ctk.CTkFrame):

    def __init__(self, parent, height=120):
        super().__init__(parent)

        self.grid_columnconfigure(0, weight=1)

        self.textbox = ctk.CTkTextbox(self, height=height)
        self.textbox.grid(row=0, column=0, sticky="nsew")

        self.textbox.insert("end", "Console initialisée...\n")
        self.textbox.configure(state="disabled")

    # LOG SIMPLE
    def log(self, message):
        self._write("[INFO] " + message)

    # LOG ERREUR
    def error(self, message):
        self._write("[ERROR] " + message)

    # LOG WARNING (optionnel)
    def warning(self, message):
        self._write("[WARN] " + message)

    # WRITE INTERNAL
    def _write(self, message):
        self.textbox.configure(state="normal")
        self.textbox.insert("end", message + "\n")
        self.textbox.see("end")
        self.textbox.configure(state="disabled")

    # CLEAR
    def clear(self):
        self.textbox.configure(state="normal")
        self.textbox.delete("1.0", "end")
        self.textbox.configure(state="disabled")