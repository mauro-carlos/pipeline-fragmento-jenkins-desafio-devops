#!/bin/bash

cd ../contruindo_ambiente/0-terraform

PUBLIC_DNS="$(terraform output | grep public_dns | awk '{print $2;exit}')"
PUBLIC_DNS=$(echo $PUBLIC_DNS | sed -e "s/\"//g")
PUBLIC_DNS=$(echo $PUBLIC_DNS | sed -e "s/,//g")

retorno=`curl http://$PUBLIC_DNS`

if [[ "$retorno" =~ "Welcome to nginx!" ]]
then
  echo "Verificação de teste com sucesso"
  exit 0
else
  echo "Erro na instalação"
  exit 1
fi