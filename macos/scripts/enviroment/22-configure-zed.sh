#!/bin/bash

# Carrega o helper
source lib/env_helper.sh

# Configuração do Zed
CONFIG_DIR_ZED="$HOME/.config/zed"
CONFIG_DIR_LOCAL="$CONFIG_DIR_MACOS/config/zed"

# Função para configurar o Zed
configure_zed() {
    print_info "Configurando o Zed..."

    # Cria a pasta de configuração do Zed se não existir
    mkdir -p "$CONFIG_DIR_ZED"

    # Copia o arquivo de configuração
    cp "$CONFIG_DIR_LOCAL/settings.json" "$CONFIG_DIR_ZED/settings.json"

    print_success "Configurações do Zed aplicadas com sucesso!"
    print_info "Para o tema 'Catppuccin Mocha' funcionar, você precisa instalá-lo manualmente no Zed."
    print_info "1. Abra o Zed."
    print_info "2. Pressione 'Cmd + Shift + P' para abrir a paleta de comandos."
    print_info "3. Digite 'zed: extensions' e pressione Enter."
    print_info "4. Procure por 'Catppuccin' e instale a extensão."
}

# Configurar o Zed
configure_zed
