#!/bin/bash

function die () { echo "${2:-error}: $1" >&2; exit 1; }

usage='mgit { DIR <dir> | DIRS <dir> | ENV | FIND <dir> | STDIN |'
usage+=$'\n''              VALS <dir(s)> END }'
usage+=$'\n''            <command> [ <arg(s)> ]'

# --

case "$1" in
  D|DIR)
    ds=( "$2" ) ; shift 2
  ;;

  S|DIRS)
    ds=() ; d="$2" ; shift 2
    for x in "$d"/*; do [ -e "$x"/.git ] && ds+=( "$x" ); done
  ;;

  E|ENV)
    ds=( $MGIT_DIRS ) ; shift
  ;;

  F|FIND)
    ds=() ; d="$2" ; shift 2
    while read -r; do ds+=( "$REPLY" ); done \
      < <( find "$d" -name '.git' | sed 's!/\.git$!!' | sort )
  ;;

  I|STDIN)
    ds=() ; shift ; while read -r; do ds+=( "$REPLY" ); done
  ;;

  V|VALS)
    ds=() ; shift
    while [ "$1" != END ]; do ds+=( "$1" ); shift; done ; shift
  ;;

  *)
    die "$usage" usage
  ;;
esac

# --

[ "$#" -eq 0 ] && die "$usage" usage

# --

for d in "${ds[@]}"; do
  echo "==> $d <=="
  pushd "$d" > /dev/null || die "failed to pushd $d"
    git "$@"
  popd > /dev/null
  echo
done

# --
