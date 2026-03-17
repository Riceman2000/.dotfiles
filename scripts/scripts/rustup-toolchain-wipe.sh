#!/usr/bin/env bash
set -e

# Get all toolchains, strip the "(default)" or "(active)" marker if present, and remove duplicates
toolchains=$(rustup toolchain list | sed -r 's/ \(default\)| \(active\)//'| sort -u)

if [[ -z "$toolchains" ]]; then
  echo "No toolchains found"
  exit 0
fi

echo
echo "The following toolchains will be removed:"
echo "$toolchains"
echo

read -rp "Proceed? (y/n) " choice
if [[ ! $choice =~ ^[Yy]$ ]]; then
    echo "Aborted"
    exit 1
fi

# Remove each toolchain
while IFS= read -r tc; do
  [[ -z "$tc" ]] && continue
  echo "Removing toolchain: $tc"
  rustup toolchain remove "$tc"
done <<< "$toolchains"

echo
echo "All toolchains removed"
