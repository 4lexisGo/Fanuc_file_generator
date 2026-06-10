from dataclasses import dataclass
from pathlib import Path


@dataclass
class GenInitConfig:

    PATH_GLOBAL: Path

    project_name: str
    main_name: str
    prefixe_init: str
    commentaire_init: str

    memo_init: int
    numero_alarme: int
    speed_linear: int
    speed_joint: int

    is_gst_prehenseur: bool
    programme_prehenseur: str | None

    is_gst_rebut: bool
    programme_rebut: str | None

    is_gst_dido: bool
    di_start: int
    di_end: int
    do_start: int

    is_gst_registre: bool
    register_number: int
    
    

    abort_on_missing_argument: bool = False

@dataclass
class EditInitConfig:

    PATH_SOURCE: Path
    PATH_INIT: Path

    prefixe_init: str