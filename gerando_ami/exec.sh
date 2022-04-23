#!/bin/bash

cd ../contruindo_ambiente/0-terraform

id="$(terraform output | grep id | awk '{print $2;exit}')"
id=$(echo $id | sed -e "s/\"//g")
export TF_VAR_id_ec2=$(echo $id | sed -e "s/,//g")

cd ../../gerando_ami

terraform init
terraform apply -auto-approve
