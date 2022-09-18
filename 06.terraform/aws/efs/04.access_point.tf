resource "aws_efs_access_point" "access_point" {
  file_system_id = aws_efs_file_system.file_system.id

  root_directory {
    path = "/root"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "777"
    }
  }

  posix_user {
    gid = 1000
    uid = 1000
  }
}
