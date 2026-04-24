terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.36.0"
        }
    }

    backend "s3" {
        bucket         = "my-terraform-state-bucket-vt-dev" 
        key            = "remote-state-demo"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile   =  true
    
   }
}

provider "aws" {
   region = "us-east-1"
}