#!/bin/bash

echo Atualizando repositórios

if ! apt-get update
then
echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
exit 1
fi
echo "Atualização feita com sucesso"
echo "Atualizando pacotes já instalados"
if ! apt-get dist-upgrade -y
then
echo "Não foi possível atualizar pacotes."
exit 1
fi
echo "Atualizaçaõ de pacotes feita com sucesso"
if ! apt-get install $1
then
echo "Não foi possível instalar o pacote $1"
exit 1
fi
echo "Instalação finalizada"
if ! wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
then
echo "Não foi possível fazer o download do Google Chrome"
exit 1
fi
echo "Google Chrome baixado com sucesso"
if ! apt install ./Downloads/google-chrome-stable_current_amd64.deb
then
echo "Não foi possível fazer a instalação do Google Chrome"
exit 1
fi
echo "Google Chrome instalado com sucesso"
if ! apt install software-properties-common apt-transport-https wget
then
echo "Não foi possível dar a inicio ao download do VSCODE"
exit 1
fi
echo "VSCODE: passo 1 realizado com sucesso"
if ! wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
then
echo "Impossível fazer a importação da chave Microsoft GPG"
exit 1
fi
echo "VSCODE: passo 2 realizado com sucesso"
if ! add-apt-repository “deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main”
then
echo "Impossível ativar o repositório do VSCODE"
exit 1
fi
echo "VSCODE: passo 3 realizado com sucesso"
echo "VSCODE: Download finalizado"
echo "VSCODE: Começando instalação"
if ! apt install code
then
echo "Impossível realizar a insttalação do VSCODE"
exit 1
fi
echo "VSCODE: Instalação concluída com sucesso"
if ! apt install nodejs
then
echo "Erro ao instalar o NODEJS"
exit 1
fi
echo "NODEJS: instalado com sucesso"
echo "Se preparando para configurar o repositório Yarn"
if ! curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
then
echo "Erro na configuração do repositório Yarn"
exit 1
fi
echo "Seguindo para o próximo passo..."
if ! apt-get install yarn
then
echo "Erro na instalação do Yarn"
exit 1
fi
echo
"Yarn: instalação concluída com sucesso"
