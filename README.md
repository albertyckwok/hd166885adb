# Project Title

TF Module to maintain a ACD (Autonomous Container/fleet Database) and multiple ADB (Autonomous Database).

**Note**:

1. The ACD will be created on the parent compartment where ADB's are located.
1. The AVM (Autonomous clust/VM) is assumed to be in the grand parent compartment.
3. It will use the first 2 character of the ADB/current compartment name as the prefix to name resources, e.g. ACD, ADB, Key Vault, Dynamic Group, Policies, etc.

## Getting Started

The simplest is to use Oracle Resource manager from UI, select Developer Services, Resource Manager, then stack to create and run it.

Alternatively, you can run it where ever you have Terraform for OCI setup. The following TF var need to be setup for your account, e.g. in .profile

```bash
export TF_VAR_tenancy_ocid="<tenancy OCID>"
export TF_VAR_user_ocid="<user OCID>"
export TF_VAR_fingerprint="<PEM key fingerprint>"
export TF_VAR_private_key_path="<path to the private key that matches the fingerprint above>"
```

### Prerequisites

Terraform with OCI plugin. All setup on apptool5.us.osc.oracle.com. You can login with your OSC Global LDAP ID.

### How to use:

```
. env-vars.sh
terraform init
terraform plan
terraform apply
```