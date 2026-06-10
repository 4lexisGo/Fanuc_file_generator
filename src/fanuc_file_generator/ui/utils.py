from tkinter import filedialog
import customtkinter as ctk

def select_folder(entry):
    path = filedialog.askdirectory()
    if path:
        entry.delete(0, "end")
        entry.insert(0, path)

def select_file(entry):
    path = filedialog.askopenfilename()
    if path:
        entry.delete(0, "end")
        entry.insert(0, path)

def add_folder(frame, row, label):
    ctk.CTkLabel(frame, text=label).grid(
        row=row,
        column=0,
        sticky="w",
        padx=10,
        pady=5
    )

    entry = ctk.CTkEntry(frame)
    entry.grid(row=row, column=1, sticky="ew", padx=10)

    ctk.CTkButton(
        frame,
        text="...",
        width=60,
        command=lambda: select_folder(entry)
    ).grid(row=row, column=2, padx=5)

    return entry

def labeled_entry(parent, row, text):
    ctk.CTkLabel(parent, text=text).grid(row=row, column=0, sticky="w", padx=10, pady=5)
    entry = ctk.CTkEntry(parent)
    entry.grid(row=row, column=1, sticky="ew", padx=10)
    return entry

def toggle_frame(enabled_var, frame):
    if enabled_var:
        frame.grid()
    else:
        frame.grid_remove()