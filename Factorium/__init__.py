import Factorium.Resources as FactoriumResources
from Broken import BrokenPlatform, BrokenProject, Path, log

FACTORIUM = BrokenProject(
    PACKAGE=__file__,
    APP_NAME="Factorium",
    APP_AUTHOR="Tremeschin",
    RESOURCES=FactoriumResources,
)

FACTORIUM_DIRS      = FACTORIUM.DIRECTORIES
FACTORIUM_DIRS.MODS = FACTORIUM_DIRS.REPOSITORY/"Mods"

if BrokenPlatform.OnLinux:
    FACTORIUM_DIRS.FACTORIO = (Path.home()/".factorio")
else:
    log.warning("Factorium outside Linux isn't tested and may fail")

FACTORIUM_DIRS.FACTORIO_MODS = FACTORIUM_DIRS.FACTORIO/"mods"
