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

def add_folder(frame, row, label, column=0, columnspan_lbl=1, columnspan_entry=1, columnspan_button=1):
    ctk.CTkLabel(frame, text=label).grid(
        row=row,
        column=column, 
        columnspan=columnspan_lbl,
        sticky="w",
        padx=10,
        pady=5
    )
    column += columnspan_lbl

    entry = ctk.CTkEntry(frame)
    entry.grid(row=row, column=column, columnspan=columnspan_entry, sticky="ew", padx=10)
    column += columnspan_entry

    ctk.CTkButton(
        frame,
        text="...",
        width=60,
        command=lambda: select_folder(entry)
    ).grid(row=row, column=column, columnspan=columnspan_button, padx=5)

    return entry

def labeled_entry(parent, row, text, column=0, columnspan_lbl=1, columnspan_entry=1):
    ctk.CTkLabel(parent, text=text).grid(row=row, column=column, columnspan=columnspan_lbl, sticky="w", padx=10, pady=5)
    column += columnspan_lbl
    entry = ctk.CTkEntry(parent)
    entry.grid(row=row, column=column, columnspan=columnspan_entry, sticky="ew", padx=10)
    return entry

def toggle_frame(enabled_var, frame):
    if enabled_var:
        frame.grid()
    else:
        frame.grid_remove()