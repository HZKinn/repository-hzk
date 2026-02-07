#!/bin/bash

# =====================
# Cores
# =====================
BLUE='\033[1;34m'
NC='\033[0m' # reset
GREEN='\033[1;32m'
RED='\033[1;31m'
CYAN='\033[0;36m'

# =====================
# Função do Banner
# =====================
banner() {
    clear
    echo -e "${BLUE}"
    cat << "EOF"
   ______                 _             _______                 __
  / ____/___ __   _____  (_)_________  /_  ___/__________ _____/ /__
 / /   / __ `/ | / / _ \/ / ___/ __ \   / /   / ___/ __ `/ ___/ //_/
/ /___/ /_/ /| |/ /  __/ / /  / /_/ /  / /   / /  / /_/ / /__   ,< 
\____/\__,_/ |___/\___/_/_/   \__,_/  /_/   /_/   \__,_/\___/_/|_|

EOF
    echo -e "                 ${RED}[+] Code by HZK [+]${NC}\n"
}

# =====================
# Funções
# =====================

# Gerar senha segura
gerar_senha() {
    echo -e "${GREEN}[+] Gerando senha segura...${NC}"
    openssl rand -base64 16
    echo ""
}

# Encurtar link (usando tinyurl API)
encurtar_link() {
    echo -e "${CYAN}--- Encurtador de Links ---${NC}"
    read -p "Digite a URL para encurtar: " url
    echo -e "${GREEN}[+] URL encurtada:${NC}"
    curl -s "https://tinyurl.com/api-create.php?url=$url"
    echo ""
}

# Mostrar IP público
mostrar_ip() {
    echo -e "${CYAN}--- Seu IP ---${NC}"
    echo -e "${GREEN}[+] Consultando servidores...${NC}"
    ip=$(curl -s ifconfig.me)
    echo -e "Seu IP público é: ${RED}$ip${NC}"
    echo ""
}

# Função de pausa (para o usuário ler o resultado antes de limpar)
pausa() {
    echo ""
    read -p "Pressione [Enter] para voltar ao menu..."
}

# =====================
# Loop Principal (Menu)
# =====================
while true; do
    banner # Limpa a tela e mostra o banner Caveira Track
    
    echo -e "${BLUE}Selecione uma opção:${NC}"
    echo "1) Gerar senha segura"
    echo "2) Encurtar link"
    echo "3) Mostrar meu IP"
    echo "0) Sair"
    echo ""
    read -p "Opção: " opcao

    case $opcao in
        1) 
            banner # Limpa o menu para mostrar o resultado limpo
            gerar_senha 
            pausa 
            ;;
        2) 
            banner 
            encurtar_link 
            pausa 
            ;;
        3) 
            banner 
            mostrar_ip 
            pausa 
            ;;
        0) 
            echo -e "${RED}Saindo...${NC}"
            exit 
            ;;
        *) 
            echo -e "${RED}Opção inválida!${NC}" 
            sleep 1 
            ;;
    esac
done
