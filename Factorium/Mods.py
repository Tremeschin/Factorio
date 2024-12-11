import json
from pathlib import Path

from attrs import define
from dotmap import DotMap

from Broken import BrokenPath
from Factorium import FACTORIUM_DIRS


@define
class FactorioMod:
    path: Path
    info: DotMap = None

    def __attrs_post_init__(self):
        self.info = DotMap(json.loads((self.path/"info.json").read_text()))

    # # Common attributes

    @property
    def name(self) -> str:
        return self.info.name

    @property
    def version(self) -> str:
        return self.info.factorio_version

    @property
    def title(self) -> str:
        return self.info.title

    @property
    def author(self) -> str:
        return self.info.author

    @property
    def description(self) -> str:
        return self.info.description

    @property
    def dependencies(self) -> list[str]:
        return self.info.dependencies

    @property
    def zip_name(self) -> str:
        return f"{self.info.name}_{self.info.version}"

    # # Development installation management

    @property
    def _mod_path(self) -> Path:
        return (FACTORIUM_DIRS.FACTORIO_MODS/self.zip_name)

    def install(self) -> None:
        BrokenPath.symlink(virtual=self._mod_path, real=self.path)

    def uninstall(self) -> None:
        for path in FACTORIUM_DIRS.FACTORIO_MODS.glob(f"{self.info.name}*"):
            BrokenPath.remove(path)

    def is_installed(self) -> bool:
        return (self._mod_path.resolve() == self.path)

    # # Releases

    def release(self) -> Path:
        BrokenPath.zip(
            path=self.path.parent,
            output=(FACTORIUM_DIRS.REPO_RELEASES/f"{self.zip_name}.zip"),
            base_dir=self.info.name
        )
