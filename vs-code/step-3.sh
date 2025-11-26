#!/usr/bin/env bash

set -e

echo "======================================="
echo "===== INSTALAÇÃO DO AMBIENTE DEV ======"
echo "======================================="


############################################################
#                     DOCKER
############################################################

echo "===== [DOCKER] Atualizando sistema ====="
sudo apt update
sudo apt upgrade -y

echo "===== [DOCKER] Removendo instalações antigas ====="
sudo apt remove -y docker docker-engine docker.io containerd runc || true

echo "===== [DOCKER] Instalando dependências ====="
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "===== [DOCKER] Adicionando chave GPG ====="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "===== [DOCKER] Adicionando repositório ====="
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "===== [DOCKER] Instalando Docker ====="
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "===== [DOCKER] Testando Docker ====="
sudo docker run --rm hello-world || echo "⚠ Docker instalado, mas teste falhou — tente novamente depois"

echo "===== [DOCKER] Adicionando usuário ao grupo docker ====="
sudo usermod -aG docker $USER
echo "⚠ Deslogue e logue novamente para usar docker sem sudo!"


############################################################
#                     NODE + YARN
############################################################

echo "===== [NODE] Atualizando sistema ====="
sudo apt update && sudo apt upgrade -y

echo "===== [NODE] Instalando NVM ====="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# força carregar nvm no mesmo script
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "===== [NODE] Instalando Node 22 ====="
nvm install 22
nvm alias default 22

echo "Node -> $(node -v)"
echo "NPM -> $(npm -v)"

echo "===== [YARN] Habilitando Corepack ====="
corepack enable
corepack prepare yarn@1 --activate
echo "Yarn -> $(yarn -v)"


############################################################
#                     JETBRAINS MONO NF
############################################################

echo "===== [FONTS] Baixando JetBrainsMono Nerd Font ====="
wget -O JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

echo "===== [FONTS] Instalando ===="
mkdir -p ~/.local/share/fonts
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

fc-cache -fv

rm JetBrainsMono.zip

echo "===== [FONTS] JetBrainsMono Nerd Font instalada ====="


############################################################
#                    CURSOR EDITOR (DEB)
############################################################

echo "===== [CURSOR] Baixando Cursor Editor ====="
wget "https://cursor.sh/download?platform=linux-deb" -O cursor-latest.deb

echo "===== [CURSOR] Instalando ====="
sudo dpkg -i cursor-latest.deb || true
sudo apt --fix-broken install -y

echo "Cursor -> $(cursor --version || echo '⚠ Cursor ainda não responde')"


############################################################
#                    TECLADO EUA INTERNACIONAL
############################################################

echo "===== [KEYBOARD] Configurando teclado EUA internacional ====="

# Define layout, persistente
sudo localectl set-x11-keymap us "" "" "terminate:ctrl_alt_bksp,grp:alt_shift_toggle"

echo "===== [KEYBOARD] Fix cedilha (ç) ====="
sudo sh -c "grep -q '^GTK_IM_MODULE=cedilla$' /etc/environment || echo 'GTK_IM_MODULE=cedilla' >> /etc/environment"


############################################################
#                     FIM
############################################################

echo "======================================="
echo "===== INSTALAÇÃO DO AMBIENTE PRONTA ==="
echo "======================================="
echo "🔁 Agora DESLOGUE e LOGUE novamente!"
echo "🔹 Teste: docker ps     (sem sudo)"
echo "🔹 Teste: node -v"
echo "🔹 Teste: yarn -v"
echo "🔹 Teste: cursor --version"
