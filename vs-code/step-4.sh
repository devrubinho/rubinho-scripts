
#!/usr/bin/env bash
set -e

echo "=========================================="
echo "===== CONFIGURANDO EXTENSÕES DO CURSOR ==="
echo "=========================================="

###############################################
# 1. DEFINIR CAMINHOS DO CURSOR (Linux/macOS)
###############################################

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  CURSOR_USER_DIR="$HOME/.config/Cursor/User"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"
else
  echo "❌ Sistema operacional não suportado automaticamente."
  exit 1
fi

mkdir -p "$CURSOR_USER_DIR"

SETTINGS_PATH="$CURSOR_USER_DIR/settings.json"
KEYBINDINGS_PATH="$CURSOR_USER_DIR/keybindings.json"

echo "Pasta detectada do Cursor: $CURSOR_USER_DIR"
echo ""

###############################################
# 2. INSTALAR EXTENSÕES DO CURSOR
###############################################

echo "===== Instalando extensões do Cursor ====="

EXTS=(
  "naumovs.color-highlight"
  "mikestead.dotenv"
  "dbaeumer.vscode-eslint"
  "eamodio.gitlens"
  "shd101wyy.markdown-preview-enhanced"
  "Prisma.prisma"
  "cipchk.px2rem"
  "natqe.reload"
  "bradlc.vscode-tailwindcss"
  "oderwat.indent-rainbow"
  "symbol-icons.vscode-symbols"          # Ícones
  "catppuccin.catppuccin-vsc"            # Tema
)

for ext in "${EXTS[@]}"; do
  echo "→ Instalando: $ext"
  cursor --install-extension "$ext" || echo "⚠ Falha ao instalar $ext (ignorando)"
done

echo "Todas as extensões tentadas."
echo ""

###############################################
# 3. APLICAR SETTINGS.JSON DO REPO
###############################################

echo "===== Aplicando settings.json ====="

curl -fsSL \
  https://raw.githubusercontent.com/rubensdeoliveira/rubinho-env/master/vs-code/user-settings.json \
  -o "$SETTINGS_PATH"

echo "→ settings.json atualizado com sucesso!"
echo ""

###############################################
# 4. APLICAR KEYBINDINGS.JSON DO REPO
###############################################

echo "===== Aplicando keybindings.json ====="

curl -fsSL \
  https://raw.githubusercontent.com/rubensdeoliveira/rubinho-env/master/vs-code/cursor-keyboard.json \
  -o "$KEYBINDINGS_PATH"

echo "→ keybindings.json atualizado com sucesso!"
echo ""

###############################################
# 5. FINAL
###############################################

echo "=========================================="
echo " Cursor configurado com sucesso! 🎉"
echo "=========================================="
echo "Abra o Cursor novamente para aplicar tudo."
