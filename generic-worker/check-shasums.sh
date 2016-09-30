#!/bin/bash

cd "$(dirname "${0}")"

while read sha file; do
  if ! [ -f "${file}" ]; then
    echo "File ${file} has not been mounted" >&2
	exit 64
  fi
  shouldbe="$(shasum -a 256 "${file}")"
  is="${sha}  ${file}"

  if [ "${shouldbe}" != "${is}" ]; then
    echo "Found:  ${sha}  ${file}" >&2
    echo "Wanted: ${out}" >&2
    exit 65
  fi
done < shasums

cat shasums
echo "All SHA256 values match expected values."

echo "Now adding a file to the cache..."
echo -n "dummy file" > my-task-caches/devtools-app/foo.bar
echo "All done."
