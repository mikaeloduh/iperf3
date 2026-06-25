#!/bin/sh
set -eu

image="${1:-local-test:latest}"
output="${2:-package_versions.txt}"
tmp_file="$(mktemp)"
raw_file="$(mktemp)"

syft "$image" -o table >"$raw_file"

awk '
  NF >= 3 {
    name[NR] = $1;
    version[NR] = $2;
    type[NR] = $3;

    if (length($1) > name_width) {
      name_width = length($1);
    }

    if (length($2) > version_width) {
      version_width = length($2);
    }
  }

  END {
    for (i = 1; i <= NR; i++) {
      if (name[i] != "") {
        printf "%-*s  %-*s  %s\n", name_width, name[i], version_width, version[i], type[i];
      }
    }
  }
' "$raw_file" >"$tmp_file"

if [ ! -s "$tmp_file" ]; then
  echo "Package snapshot is empty" >&2
  rm -f "$tmp_file"
  rm -f "$raw_file"
  exit 1
fi

mv "$tmp_file" "$output"
rm -f "$raw_file"
