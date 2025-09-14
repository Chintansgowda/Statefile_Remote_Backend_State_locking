provider "aws" {

    region = "us-east-1"
  
}


resource "aws_instance" "my_instance" {

    ami = "ami-0360c520857e3138f"
    instance_type = "t2.micro"
    key_name = "aws-login"
}

resource "aws_s3_bucket" "my_instance" {

    bucket = "csg-s3-remote-bend"
  
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }    
}