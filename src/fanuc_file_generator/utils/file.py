

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