from tkinter import filedialog

def select_folder(entry_widget):

    folder = filedialog.askdirectory()

    if folder:
        entry_widget.delete(0, "end")
        entry_widget.insert(0, folder)
        
    return folder