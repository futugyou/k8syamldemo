resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
} 

data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  access_control_policy {
    grant {
      grantee {
        uri   = "http://acs.amazonaws.com/groups/global/AllUsers"
        type  = "Group"
      }
      permission = "READ_ACP"
    }
    
    grant {
      grantee {
        uri   = "http://acs.amazonaws.com/groups/global/AllUsers"
        type  = "Group"
      }
      permission = "READ"
    }

    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}