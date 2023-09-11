1. sort of database to map Terraform config to the real world.
- Created in same Dir (Working Dir) => Terraform stores state locally in a file named terraform.tfstate
-  When you have a resource resource "aws_instance" "foo" to i-abcd1234 in aws cloud.
-  If Imported Resource to TF make sure you have 1 - 1 Mapping else Errors for Fresh TF Resourecs TF takes Care of it.
2. Terraform must also track metadata such as resource dependencies.
- So If you destroy.. All dependent rrsourecs erased
3. Performance
- TF plan and Apply command Refreshes State
- for small infra its good
- Large Infra : querying every resource is too slow. Many cloud providers do not provide APIs to query multiple resources at once, and the round trip time for each resource is hundreds of milliseconds.
- cloud providers almost always have API rate limiting so Terraform can only request a certain number of resources in a period of time.
- -refresh=false flag as well as the -target flag in order to work around this. In these scenarios, the cached state is treated as the record of truth.

> "So in your team it is important for everyone to be working with the same state so that operations will be applied to the same remote objects"

## Remote State
- A shared place where all TF users can access latest state file
- Terraform supports storing state in Terraform Cloud, HashiCorp Consul, Amazon S3, Azure Blob Storage, Google Cloud Storage
- Remote state allows you to share output values with other configurations. => For example, a core infrastructure team can handle building the core machines, networking, etc. and can expose some information to other teams to run their own infrastructure. As a more specific example with AWS: you can expose things such as VPC IDs, subnets, NAT instance IDs, etc. through remote state and have other Terraform states consume that

## Backends 
=> **Backends define where Terraform's state snapshots are stored.**
- AzureRM = Storage Account = https://developer.hashicorp.com/terraform/language/v1.1.x/settings/backends/azurerm
- AWS = S3 + DynamoDB = https://developer.hashicorp.com/terraform/language/v1.1.x/settings/backends/s3
## state locking
- If supported by your backend, Terraform will AUTO lock your state for all operations that could write state. This prevents others from acquiring the lock and potentially corrupting your state. [NO Message displayed it is Locked]
- Force Unlock , 
Exmaple :  https://developer.hashicorp.com/terraform/language/v1.1.x/state/remote-state-data
