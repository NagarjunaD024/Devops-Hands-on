terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "devops-tofu-state"             
    key            = "ch5/tofu/live/lambda-sample/terraform.tfstate" 
    region         = "us-east-2"                                     
    encrypt        = true                                            
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "devops-tofu-state"             
  }
}