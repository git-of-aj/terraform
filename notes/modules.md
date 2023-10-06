A module is a container for multiple resources that are used together.
- Within the block body (between { and }) are the arguments for the module
- The .tf files in your working directory when you run terraform plan or terraform apply together form the root module
- If it isn't complicated / creates many things... Do not create a module for that = "We do not recommend writing modules that are just thin wrappers around single other resource types"
```tf
module "servers" {
  source = "./app-cluster" # or publicly available 

  servers = 5
}
```
- [Modules Syntax](https://developer.hashicorp.com/terraform/language/modules/syntax)
- accessing output from Modules: server: ModuleName instance: outputName `module.servers.instance_ids`
- [Create Module](https://developer.hashicorp.com/terraform/language/modules/develop)
- count - Creates multiple instances of a module from a single module block. See the count page for details.

- for_each - Creates multiple instances of a module from a single module block. See the for_each page for details.

- providers - Passes provider configurations to a child module. See the providers page for details. If not specified, the child module inherits all of the default (un-aliased) provider configurations from the calling module.

- depends_on 
