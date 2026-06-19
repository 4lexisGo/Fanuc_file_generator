
    
class NameBuilder:
    """
    Générateur de noms dynamiques basé sur un pattern formaté.

    Permet de :
    - Centraliser le format du nom (pattern unique)
    - Centraliser les variables de base (contexte commun)
    - Ajouter des variables dynamiques à chaque appel
    - Éviter toute duplication de logique dans le code

    Exemple de pattern :
        "{name_main}{name_inter}{i_ligne:02d}"
    """

    def __init__(self, pattern, **base_context):
        """
        Initialise le générateur.

        :param pattern: string contenant les placeholders format()
                        Exemple: "{name_main}{name_inter}{i_ligne:02d}"
        :param base_context: variables communes à tous les noms
                             (ex: name_main, name_inter, machine, etc.)
        """
        self.pattern = pattern              # Modèle de formatage unique
        self.context = base_context         # Contexte partagé (mutable)

    def build(self, **extra):
        """
        Construit un nom en combinant :

        - le contexte de base (défini à l'initialisation)
        - les variables supplémentaires passées à l'appel

        :param extra: variables dynamiques (ex: i_ligne=3)
        :return: string formatée selon le pattern
        """
        # On copie le contexte pour éviter de modifier l'original
        ctx = self.context.copy()

        # On ajoute / surcharge avec les variables dynamiques
        ctx.update(extra)

        # Génération finale du nom
        return self.pattern.format_map(ctx)