#!/bin/bash

cd ../contruindo_ambiente/0-terraform

echo "Aguardando criação de maquinas ..."
sleep 10 # 10 segundos

PUBLIC_DNS=$(terraform output public_dns)
PUBLIC_DNS=$(echo $PUBLIC_DNS | sed -e "s/\"//g")

retorno=`curl http://$PUBLIC_DNS`

if [[ "$retorno" =~ "Welcome to nginx!" ]]
then
  echo "Processo instalado com sucesso"
  exit 0
else
  echo "Erro na instalação"
  exit 1
fi