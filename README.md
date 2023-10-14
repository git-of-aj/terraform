# Terraform
- variable Name can't be used in key of backend
Followed Zeal Vora Udemy Course - https://github.com/zealvora/terraform-beginner-to-advanced-resource
+ Terraform Docs 

### Phase -1
- Contains all Basic Terraform Features (providers,tfvars,variables,output, alias etc)
- for Azure ONLY
1. Azure create VNET, VM
2. upload local files to Blob 
3. Modify Resources
4. Check status Desired state vs Current State

### AWS 
- contains all codes for AWS

~ means update in place
## Terraform Module
- TF init install everything => checks tf version in both module and main file
- my module ~2.0 while main.tf ~3..0
```ps1
│ Error: Failed to query available provider packages
│
│ Could not retrieve the list of available versions for provider hashicorp/azurerm: no available releases match 
│ the given constraints ~> 2.0, ~> 3.0
```
## TF Cloud
Terraform Cloud (free for up to five users), you can securely share your state with your teammates, provide a stable environment for Terraform to run in, and prevent race conditions when multiple people make configuration changes at once.

You can also connect Terraform Cloud to version control systems (VCSs) like GitHub, GitLab, and others, allowing it to automatically propose infrastructure changes when you commit configuration changes to VCS. This lets you manage changes to your infrastructure through version control, as you would with application code.

## High level
```tf
output "subnet_info" {
  value = {
    for idx, subnet in azurerm_subnet.subnet :
    subnet.name => {
      id   = subnet.id
      vnet = subnet.virtual_network_name
    }
  }
}
```
The `output` block you provided is used to define an output variable named "subnet_info." Let's break down the use of each word and element in this block:

1. `output`: This is the keyword used to define an output variable in Terraform. It tells Terraform that you want to expose certain information from your infrastructure for later use or display.

2. `"subnet_info"`: This is the name of the output variable. It's a user-defined name that you can use to refer to this output elsewhere in your Terraform configuration or when querying the state of your infrastructure.

3. `value`: This is an attribute within the `output` block. It specifies what value or information you want to expose as the output. In this case, you are specifying a complex value that consists of a map.

4. `for idx, subnet in azurerm_subnet.subnet`: This line uses a `for` expression to iterate over the `azurerm_subnet.subnet` resource. It assigns each subnet resource to the variable `subnet`, and it also creates an index variable `idx` that represents the current iteration index. This is a way to loop through all the subnets created by the `azurerm_subnet` resource.

5. `subnet.name => { ... }`: Inside the `for` expression, this line constructs a map where the key is `subnet.name`, which is the name of each subnet, and the value is a nested map. This nested map contains two key-value pairs:
   
   - `id = subnet.id`: This key-value pair associates the subnet name with its corresponding ID. `subnet.id` is an attribute of the subnet resource that holds the unique identifier of the subnet.

   - `vnet = subnet.virtual_network_name`: This key-value pair associates the subnet name with the name of the virtual network (VNet) to which the subnet belongs. `subnet.virtual_network_name` is an attribute that represents the name of the VNet associated with the subnet.

In summary, this `output` block constructs a map named "subnet_info" that contains information about each subnet created by the `azurerm_subnet.subnet` resource. It includes the subnet name as the key, and for each subnet, it provides its ID and the name of the associated VNet. This information can be accessed and used later in your Terraform configuration or for external purposes like reporting or monitoring.
