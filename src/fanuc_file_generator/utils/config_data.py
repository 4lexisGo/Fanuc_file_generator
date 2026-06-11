from dataclasses import dataclass
from pathlib import Path


@dataclass
class GenInitConfig:

    PATH_GLOBAL: Path

    project_name: str
    main_name: str
    prefixe_init: str
    commentaire_init: str

    register_init: int
    alarme_value: int
    speed_linear: int
    speed_joint: int
    abort_on_missing_argument: bool

    is_gst_prehenseur: bool
    programme_prehenseur: str | None
    register_prehenseur: int | None

    is_gst_rebut: bool
    programme_rebut: str | None

    is_gst_dido: bool
    do_start: int | None
    is_alternated_do_value: bool | None
    is_di_start_stop : bool | None
    di_start: int | None
    di_stop: int | None
    is_di_liste: bool | None
    di_liste : str | None

    is_gst_register: bool
    register_programme: int | None

@dataclass
class EditInitConfig:

    PATH_SOURCE: Path
    PATH_INIT: Path

    prefixe_init: str