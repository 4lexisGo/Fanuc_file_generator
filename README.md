# Fanuc File Generator

Bibliothèque Python pour générer, modifier et filtrer des programmes destinés aux robots/commandes Fanuc.

Ce package se concentre sur :

- la génération de programmes de repli automatique (`folding`),
- la production et l'édition de fichiers Fanuc LS (`ls_generating`),
- la génération de routines de palpage Renishaw (`probing`),
- les utilitaires de gestion de fichiers et de géométrie (`utils`).

## Table des matières

- [À propos](#%C3%A0-propos)
- [Fonctionnalités](#fonctionnalit%C3%A9s)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [API principale](#api-principale)
- [Structure du projet](#structure-du-projet)
- [Développement](#d%C3%A9veloppement)
- [Licence](#licence)

## Fonctionnalités

- Création de fichiers Fanuc LS complets avec sections `/PROG`, `/MN`, `/POS`, `/END`.
- Ajout et édition de séquences de mouvements `/MN` et de positions `/POS`.
- Filtrage et transformation de programmes LS existants (mémos, vitesses, compteurs, skips, conversions d'accélération).
- Génération de séquences de palpage Renishaw, activation/désactivation de palpeur et points de contact.
- Génération de routines d'init robot et de sélection de trajectoires.
- Utilitaires de gestion de noms et de normalisation d'extensions de fichiers.

## Installation

Ce package est prêt à être utilisé comme module Python.

1. Installez en mode développement depuis le dépôt :

```bash
pip install -e .
```

2. Ou utilisez Poetry si vous souhaitez un environnement isolé :

```bash
poetry install
poetry run python -m pip install -e .
```

3. Si le package est publié sur PyPI à l'avenir :

```bash
pip install fanuc-file-generator
```

## Utilisation

Importer le package et utiliser ses classes exposées par `fanuc_file_generator` :

```python
from fanuc_file_generator import (
    LSFileBuilder,
    LSFileEditer,
    LSFileFilter,
    MouvementOptions,
    FanucGenerator,
    Renishaw,
    PalpageCentreOutils,
    InitGenerator,
    NameBuilder,
    normalize_extensions,
    get_fichiers,
    point_cercle_portion,
)

# Exemple de génération de fichier LS
builder = LSFileBuilder('mon_programme', owner='user', comment='programme demo')
builder.add_mn_lines(['L P[1] 100mm/sec FINE', 'J P[2] 20% FINE'])
builder.add_pos_lines(['P[1] {...}', 'P[2] {...}'])
builder.build_file()
```

```python
# Exemple de filtrage d'un fichier LS existant
filterer = LSFileFilter(register_number=66, rules_calcul=['CALC_A'], rules_pince=['TOOL_A'])
cleaned_line = filterer.modify_line('L P[1] 200mm/sec CNT100')
```

```python
# Exemple de génération Renishaw
bloc = Renishaw.activer_palpeur_mobile()
bloc += Renishaw().palpage_cercle_ext(1, 'S1')
```

## API principale

Les classes et fonctions exportées depuis `src/fanuc_file_generator/__init__.py` sont :

- `InitGenerator` — génération de routines d'init et de sélection de parcours.
- `LSFileBuilder` — construction de fichiers LS et sections `/MN` et `/POS`.
- `LSFileEditer` — édition de fichiers LS existants.
- `LSFileFilter` — filtrage et transformation de programmes LS.
- `MouvementOptions` — construction de commandes Fanuc `L`/`J` avec options.
- `FanucGenerator` — génération de blocs de code Fanuc réutilisables.
- `Renishaw` — génération de blocs de palpage Renishaw.
- `PalpageCentreOutils` — génération de points de palpage pour les centres de table.
- `NameBuilder` — construction de noms dynamiques à partir d'un pattern.
- `normalize_extensions` — renommage `.LS` vers `.ls`.
- `get_fichiers` — lecture de fichiers par extension dans un dossier.
- `point_cercle_portion` — calcul de positions sur un cercle pour le palpage.

## Structure du projet

- `src/fanuc_file_generator/__init__.py` : point d'entrée du package.
- `src/fanuc_file_generator/folding/` : génération de programmes de repli automatique.
- `src/fanuc_file_generator/ls_generating/` : génération, modification et parsing des fichiers Fanuc LS.
- `src/fanuc_file_generator/probing/` : génération des routines de palpage Renishaw et des templates associés.
- `src/fanuc_file_generator/utils/` : utilitaires de fichiers, géométrie et nommage.

## Développement

Ce package est prévu pour être utilisé comme module ; cependant, il peut aussi servir de base pour de nouveaux templates et fonctions.

- Pour étendre le package, ajoutez des fonctions ou classes dans les sous-modules existants.
- Pour personnaliser la génération, créez vos propres templates dans un projet séparé et utilisez l'API du package.
- Préférez l'importation de classes depuis `fanuc_file_generator` plutôt que l'édition directe du code installé.
- Si vous modifiez le package, utilisez un environnement virtuel ou Poetry pour isoler vos tests.

## Licence

Licence MIT — voir le fichier [LICENSE](LICENSE).