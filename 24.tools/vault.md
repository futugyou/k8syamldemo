#### [Document](https://www.vaultproject.io/)
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install vault

Unseal Key: 02FvM3GOAfHH4AVy/r9RgP5/PD5yjSEiExYkJQE8MVI=
Root Token: s.hIObd20gFdGC8HQmI6BLdTRr

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN="s.hIObd20gFdGC8HQmI6BLdTRr"

vault kv put secret/hello foo=world excited=yes
vault kv get secret/hello

sudo apt install jq
vault kv get -format=json secret/hello | jq -r .data.data
```

####  [Document2](https://www.vaultproject.io/docs/secrets)
```
vault secrets enable -path=kv kv
```