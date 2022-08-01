#!/usr/bin/env bash

INSTALL_HUSKY_COMMAND="npx husky install"

# Install esh
install_esh() {
  local TMP_PATH=$(mktemp -d)

  cd "$TMP_PATH"
  wget https://github.com/jirutka/esh/archive/v0.3.2/esh-0.3.2.tar.gz
  tar -xzf esh-0.3.2.tar.gz
  mv esh-0.3.2 "$HOME/.esh"
  cat <<- "EOF" >> $HOME/.bashrc

# esh
export PATH=$PATH:$HOME/.esh
EOF
  rm -rf "$TMP_PATH"
}

if ! command -v esh &> /dev/null; then
  (install_esh)
fi

npm i

$INSTALL_HUSKY_COMMAND

git submodule update --init --recursive 2> mjl-error.log 1> /dev/null
git submodule foreach --recursive 'git checkout -b submodules | echo -n' 2> mjl-error.log 1> /dev/null
git submodule foreach --recursive $INSTALL_HUSKY_COMMAND 2> mjl-error.log 1> /dev/null
