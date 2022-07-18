#### [Document](https://www.terraform.io/downloads.html)
```
wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
unzip terraform_1.0.0_linux_amd64.zip
mv terraform /usr/local/bin/
terraform -version
terraform init
terraform init -upgrade 
terraform plan
terraform apply
terraform apply -auto-approve
terraform state
terraform workspace
terraform destroy
terraform destroy -auto-approve
```

###  [Document](https://github.com/GoogleCloudPlatform/terraformer)
```
terraformer import aws --resources=sg  --regions=ap-southeast-1
terraformer import aws --resources=aws_ecs_cluster  --regions=ap-southeast-1
```