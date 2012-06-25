#!/bin/bash

function die () { echo "error: $1" >&2; exit 1; }

if [ -n "$MGIT_DIRS" ]; then
  ds=( $MGIT_DIRS )
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
