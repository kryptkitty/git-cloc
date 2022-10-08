{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "git-cloc";
  runtimeInputs = with pkgs; [ git cloc coreutils ];

  text = ''
    if [ -z "''${1-}" ];then
      1>&2 echo 'usage: git-cloc GITREPO'
      exit 1
    fi

    TMPDIR="$(mktemp -d)"
    
    # we intend to create a quoted version of TMPDIR right now so we do _not_ want
    # to quote the expansion of printf below.
    # shellcheck disable=SC2064
    trap "rm -rf $(printf %q "$TMPDIR")" EXIT
    git clone "$1" "$TMPDIR/g"
    cloc "$TMPDIR/g"
  '';
}
