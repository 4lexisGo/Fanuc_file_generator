from pathlib import Path

class FileContext:
    """
    Fournit un accès propre aux lignes du fichier
    (ligne courante, suivante, précédente).
    """

    def __init__(self, lines):
        self.lines = lines

    def get(self, i):
        return self.lines[i]
    
    def previous(self, i):
        return self.lines[i - 1] if i - 1 >= 0 else None

    def next(self, i):
        return self.lines[i + 1] if i + 1 < len(self.lines) else None

    def strip(self, line):
        return line.strip()
    
def get_fichiers(dossier, extensions=[".LS"], root=False, extension=False):
    """
    Retourne les fichiers ayant certaines extensions dans un dossier.

    :param dossier: chemin du dossier (str ou Path)
    :param extensions: liste d'extensions par défaut : [".LS"]
    :return: liste des fichiers correspondants

    """


    # normalise les extensions en majuscules
    extensions = [ext.upper() for ext in extensions]

    dossier = Path(dossier)

    fichiers = []
    for fichier in dossier.iterdir():
        if fichier.is_file() and fichier.suffix.upper() in extensions:
            if root:
                fichiers.append(fichier)
            elif extension:
                fichiers.append(fichier.name)
            else:
                fichiers.append(fichier.stem)

    return fichiers