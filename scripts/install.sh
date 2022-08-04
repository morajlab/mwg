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

install_bpm() {
  curl -fsSL \
  https://raw.githubusercontent.com/morajlab/bpm/master/packages/install/install.sh | bash
}

if ! command -v esh &> /dev/null; then
  (install_esh)
fi

if ! command -v bpm &> /dev/null; then
  (install_bpm)
  source $HOME/.bashrc
fi

bpm install log color

npm i

npx husky install
