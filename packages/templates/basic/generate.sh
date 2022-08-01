#!/usr/bin/env bash

CURRENT_TEMPLATE_PATH=$(dirname $0)

generate() {
  while IFS= read -r file; do
    esh -o ${file%.esh} $file workspace_name="$1" workspace_description="$2"
    rm -rf $file
  done < <(find $CURRENT_TEMPLATE_PATH -name '*.esh')
}

workspace_name='workspace_name'
workspace_description='workspace description'

while [ "$#" -gt 0 ]; do
  case "${1^^}" in
    "--NAME" | "-N")
      workspace_name=$2

      shift
      shift
    ;;
    "--DESC" | "-D")
      workspace_description=$2

      shift
      shift
    ;;
    *)
      shift
    ;;
  esac
done

generate "$workspace_name" "$workspace_description"
