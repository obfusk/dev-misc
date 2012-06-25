#!/bin/bash

function die () { echo "error: $1" >&2; exit 1; }

if [ -n "$MGIT_DIRS" ]; then
  ds=( $MGIT_DIRS )
elif [ "$1" == STDIN ]; then
  ds=() ; shift
  while read -r; do ds+=( "$REPLY" ); done
elif [ "$1" == DIR ]; then
  ds=( "$2" ) ; shift 2
elif [ "$1" == DIRS ]; then
  ds=() ; d="$2" ; shift 2
  for x in "$d"/*; do [ -e "$x"/.git ] && ds+=( "$x" ); done
else
  ds=( $( find . -name '.git' | sed 's!/\.git$!!' | sort ) )
fi

for d in "${ds[@]}"; do
  echo "==> $d <=="
  pushd "$d" > /dev/null || die "failed to pushd $d"
    git "$@"
  popd > /dev/null
  echo
done

# --
