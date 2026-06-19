from fanucfilegenerator.ls_generating.templates import FanucGenerator
    
class Renishaw:
    """
    Classe pour générer les blocs de code de palpage Renishaw.
    """
    
    def __init__(self):
        """
        Initialise la classe Renishaw.
        """
    
    @staticmethod
    def activer_palpeur_mobile():
        """
        Génère les instructions d'activation du palpeur mobile.
        """
        bloc = [
            "!Selection et activation",
            "!Palpeur mobile",
            "CALL RSWPRBSLCTPS",
            "CALL RSWPRBPWRON",
            "",
        ]
        return bloc
    
    @staticmethod
    def activer_palpeur_fixe():
        """
        Génère les instructions d'activation du palpeur fixe.
        """
        bloc = [
            "!Selection et activation",
            "!Palpeur fixe",
            "CALL RSWPRBSLCTTS",
            "CALL RSWPRBPWRON",
            "",
        ]
        return bloc
    
    @staticmethod
    def desactiver_palpeur():
        """
        Génère les instructions de désactivation du palpeur.
        """
        bloc = [
            "!Desactivation",
            "CALL RSWPRBPWROFF"
            "",
        ]
        return bloc

    def palpage_cercle_ext(self, n, surfaceID, direction='1,0,0', normal_dir='0,0,1', diametre=20, dist_appro=10):
        """
        Génère le bloc de palpage du cercle extérieur.
        """
        bloc = [
            "!Routine cercle ext.",
            FanucGenerator.move_l(n),
            f"CALL RSWTCHCIREX({surfaceID},{direction},{normal_dir},{diametre},{dist_appro})",
            ""
        ]
        return bloc
    
    def palpage_point_part(self, n, surfaceID, dir='0,0,(-1)'):
        """
        Génère le bloc de palpage d'un point suivant la direction du repère'.
        """
        bloc = [
            "!Routine touch part",
            FanucGenerator.move_l(n),
            f"CALL RSWTCHDIRPRT({surfaceID},{dir})",
            "",
        ]

        return bloc