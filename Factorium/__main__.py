import sys

from attrs import Factory, define

from Broken import BrokenPath, BrokenTyper, shell
from Factorium import FACTORIUM_DIRS
from Factorium.Mods import FactorioMod


@define
class FactoriumManager:
    cli: BrokenTyper = Factory(lambda: BrokenTyper(help=False))
    mods: list[FactorioMod] = Factory(list)

    def __attrs_post_init__(self):
        for path in BrokenPath.directories(FACTORIUM_DIRS.MODS):
            self.mods.append(FactorioMod(path))
        self.cli.command(self.get_raw,   help=True)
        self.cli.command(self.install,   help=True)
        self.cli.command(self.uninstall, help=True)
        self.cli.command(self.release,   help=True)

    def install(self):
        for package in self.mods:
            package.uninstall()
            package.install()

    def uninstall(self):
        for package in self.mods:
            package.uninstall()

    def release(self):
        for package in self.mods:
            package.release()

    def get_raw(self):
        """Download Factorio's latest raw.lua file with all prototypes"""
        shell("wget", "-O", (FACTORIUM_DIRS.MODS/"raw.lua"),
            "https://gist.githubusercontent.com/Bilka2/6b8a6a9e4a4ec779573ad703d03c1ae7/raw")


def main():
    manager = FactoriumManager()
    manager.cli(sys.argv[1:])

if (__name__ == "__main__"):
    main()