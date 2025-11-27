#!/usr/bin/env bash

set -e

echo "=============================================="
echo "========= [02] INSTALLING PREZTO ============="
echo "=============================================="

ZSH_BIN=$(which zsh)

if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  echo "Installing Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  echo "Prezto already installed."
fi

echo "Creating Prezto runcom symlinks..."
# Use Zsh to create symlinks (Zsh syntax required for glob patterns)
PREZTO_RUNCOMS_DIR="${ZDOTDIR:-$HOME}/.zprezto/runcoms"
if [ -d "$PREZTO_RUNCOMS_DIR" ]; then
  for rcfile in "$PREZTO_RUNCOMS_DIR"/*; do
    if [ -f "$rcfile" ] && [ "$(basename "$rcfile")" != "README.md" ]; then
      rcfile_name=$(basename "$rcfile")
      ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.$rcfile_name"
    fi
  done
else
  echo "Warning: Prezto runcoms directory not found"
fi

echo "Writing .zpreztorc (module config)..."
cat > ~/.zpreztorc << 'EOF'
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'autosuggestions' \
  'syntax-highlighting'
EOF

echo "=============================================="
echo "============== [02] DONE ===================="
echo "=============================================="
echo "▶ Next, run: bash <(curl -fsSL https://raw.githubusercontent.com/rubensdeoliveira/rubinho-env/master/linux/scripts/03-install-starship.sh)"

