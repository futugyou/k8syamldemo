###  [localstack](https://docs.localstack.cloud/overview/)
```
python3 -m pip install localstack
localstack update all
localstack start
localstack status services
```

###  [tflocal ](https://docs.localstack.cloud/integrations/terraform/)
```
pip install terraform-local
tflocal init
tflocal apply -auto-approve
tflocal destroy -auto-approve
```