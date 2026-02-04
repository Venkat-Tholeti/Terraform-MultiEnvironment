bucket  = "terraform-dev-practice"
key     = "tfvars_demo"
region  = "us-east-1"
encrypt = true
#dynamodb_table = "terraform-remote-state"
use_lockfile = true



#we have to use terraform init -backend-config=DevEnvironment/backend.tfvars ( so now this will initialize)
#we have to use terraform plan -var-file=DevEnvironment/dev.tfvars
#we have to use terraform apply -var-file=DevEnvironment/dev.tfvars -auto-approve
#we have to use terraform destroy -var-file=DevEnvironment/dev.tfvars -auto-approve

#IF WE ARE CHANGING FROM DEV TO PROD WE HAVE TO GIVE RECONFIGURE IN INIT 
 # terraform init -reconfigure -backend-config=PRODEnvironment/backend.tfvars