#!/bin/bash

# Constantes para facilitar a utilização das cores.
RED='\033[31;1m'
GREEN='\033[32;1m'
YELLOW='\033[33;1m'
END='\033[m'

if [ "$1" == "" ]
then
	echo " "
	echo -e "${YELLOW} Este utilitario realiza uma${END} ${RED}tentativa${END} ${YELLOW}de transferencia de zona${END}"
	echo -e "${YELLOW} com a finalidade de obter os subdominios de um site.${END}"
	echo " "
	echo -e "${GREEN} [*] COMO USAR:${END}"
	echo "     Preencha o site alvo como argumento."
	echo "     Exemplo: $0 sitealvo.com"
else
	echo " "
	echo -e "${GREEN} [*] Tentando transferencia de zona...${END}"
	echo " "
	for servidor in $(host -t ns $1 | cut -d " " -f4);
	do
	host -l -a $1 $servidor | grep IN;
	done
	echo " "
	echo -e "${YELLOW} [-] Finalizado.${END}"
fi
