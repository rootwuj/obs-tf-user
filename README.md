# Terraform Rancher Users

## 目的

批量创建用户，用户UI自动化(edit-user-role.spec.ts)的初始数据准备。创建用户c1,c2,c3,p1,p2,p3

## 如何使用

**准备工作**

1. Rancher server URL
2. admin token

## terraform.tfvars Setup

This is how your `terraform.tfvars` file should look like.

```hcl
rancher_url       = "url-to-your-rancher"
rancher_token_key = "bearer-token-you-create-in-rancher-ui"
user_password     = "whatever-password-you-want-users-to-have"
user_name         = "user name list"
```

## 如何执行terraform
```
# 初始化项目
terraform init

# 使用apply运行. 当 Terraform 要求您确认类型yes并按ENTER。
terraform apply -var-file="terraform.tfvars"
```


## 问题处理

如果在`terraform init`时，遇到下面错误，开启vpn，执行`复制终端代码命令`，然后再场景，就ok了


```
❯ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding rancher/rancher2 versions matching "3.2.0"...
╷
│ Error: Failed to install provider
│
│ Error while installing rancher/rancher2 v3.2.0: could not query provider registry for registry.terraform.io/rancher/rancher2: failed to
│ retrieve authentication checksums for provider: the request failed after 2 attempts, please try again later: Get
│ "https://github.com/rancher/terraform-provider-rancher2/releases/download/v3.2.0/terraform-provider-rancher2_3.2.0_SHA256SUMS":
│ net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
╵
```
