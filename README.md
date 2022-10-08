# `git-cloc`

A nix flake involving git-cloc.

## Usage

After [configuring your nix install to work with flakes][EnableFlakes]:

```bash
nix run github:kryptkitty/git-cloc#
```

or

```bash
nix run github:kryptkitty/git-cloc#git-cloc
```

or, if you don't have nix and don't know if you want it yet, here's a docker command that will do the same

```bash
docker run -ti nixos/nix nix run github:kryptkitty/git-cloc# --extra-experimental-features nix-command --extra-experimental-features flakes
```


[EnableFlakes]: https://nixos.wiki/wiki/Flakes#Enable_flakes
