# IMC access and other compute policies
resource "intersight_access_policy" "imm-access-policy" {
  name        = var.imc_access_policy
  inband_vlan = var.imc_access_vlan
  inband_ip_pool {
    object_type = "ippool.Pool"
    moid        = "5fa9ad8a6962752d315d37ef"
    /*
      "ClassId": "ippool.Pool",
      "Name": "SJC07-R14-15-IP",
      selector = "Name eq '${var.ip_pool}'"
      */
  }

  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

  dynamic "profiles" {
    for_each = intersight_server_profile.node1
    content {
      moid        = profiles.value["moid"]
      object_type = "server.Profile"
    }
  }
}

resource "intersight_iam_end_point_user_policy" "imm-local-user-policy" {
  name = var.local_user_policy
  password_properties {
    object_type              = "iam.EndPointPasswordProperties"
    enable_password_expiry   = false
    enforce_strong_password  = false
    password_history         = 5
    password_expiry_duration = 90
  }

  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

  dynamic "profiles" {
    for_each = intersight_server_profile.node1
    content {
      moid        = profiles.value["moid"]
      object_type = "server.Profile"
    }
  }
}

resource "intersight_iam_end_point_user" "imm-user" {
  name = var.local_username

  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

}

data "intersight_iam_end_point_role" "imm-endpoint-role" {
  name = "admin"
  type = "IMC"
}

resource "intersight_iam_end_point_user_role" "imm-user-role" {
  end_point_user {
    moid        = intersight_iam_end_point_user.imm-user.id
    object_type = "iam.EndPointUser"
  }
  end_point_role {
    moid        = data.intersight_iam_end_point_role.imm-endpoint-role.moid
    object_type = "iam.EndPointRole"
  }
  end_point_user_policy {
    moid        = intersight_iam_end_point_user_policy.imm-local-user-policy.id
    object_type = "iam.EndPointUserPolicy"
  }
  password = var.local_username_password
  enabled  = true
}