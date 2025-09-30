terraform {
  backend "s3" {
    bucket         = "fundamentals-of-devops-nandu143"             
    key            = "ch5/tofu/live/tofu-sate/terraform.tfstate" 
    region         = "us-east-2"                                     
    encrypt        = true                                            
    dynamodb_table = "fundamentals-of-devops-nandu143"             
  }
}