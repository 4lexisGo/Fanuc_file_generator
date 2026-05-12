from tkinter import filedialog

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