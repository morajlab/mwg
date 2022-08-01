#!/usr/bin/env bash

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

npx husky install
