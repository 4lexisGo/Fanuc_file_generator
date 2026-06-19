from pathlib import Path

def normalize_extensions(path: Path, recursive: bool = False):
    """
    Renomme les fichiers ayant l'extension .LS en .ls.

    Args:
        path: Dossier à parcourir.
        recursive: Si True, parcourt aussi les sous-dossiers.
    """
    files = path.rglob("*") if recursive else path.iterdir()

    for file in files:
        if file.is_file() and file.suffix == ".LS":
            new_file = file.with_suffix(".ls")
            file.rename(new_file)
    
def get_fichiers(dossier, extensions=[".ls"], root=False, extension=False):
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