#!/usr/bin/bash

vault operator init > /home/vault/keys
export KEY1=$(cat /home/vault/keys | grep "Unseal Key 1" | cut -d ' ' -f4)
export KEY2=$(cat /home/vault/keys | grep "Unseal Key 2" | cut -d ' ' -f4)
export KEY3=$(cat /home/vault/keys | grep "Unseal Key 3" | cut -d ' ' -f4)
export KEY4=$(cat /home/vault/keys | grep "Unseal Key 4" | cut -d ' ' -f4)
export KEY5=$(cat /home/vault/keys | grep "Unseal Key 5" | cut -d ' ' -f4)
export ROOT_TOKEN=$(cat /home/vault/keys | grep "Initial Root Token:" | cut -d ' ' -f4)

cat /home/vault/keys
echo $KEY1 $KEY2 $KEY3 $KEY4 $KEY5 $ROOT_TOKEN
rm /home/vault/keys

./unseal.sh

echo $(curl http://localhost:8200/v1/sys/seal-status)
