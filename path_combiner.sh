# takes a variable number of files and makes permutations based on every line give

#!/bin/bash

combine() {
  local prefix="$1"
  shift
  local file="$1"

  while IFS= read -r line; do
    local new="$prefix$line"
    if [ $# -eq 1 ]; then
      echo "echo \"$new\""
      echo "$new"
    else
      combine "$new" "${@:2}"
    fi
  done < "$file"
}

combine "" "$@"
