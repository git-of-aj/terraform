 Each plugin exposes an implementation for a specific service, such as AWS, or provisioner, such as bash
- Terraform Core uses remote procedure calls (RPC) to communicate with Terraform Plugins,
- When terraform init is run with the -upgrade option, it re-checks the Terraform Registry for newer acceptable provider versions and downloads them if available.
This behavior only applies to providers whose only acceptable versions are in the correct subdirectories under .terraform/providers/ (the automatic downloads directory); if any acceptable version of a given provider is installed elsewhere, terraform init -upgrade will not download a newer version of it.
