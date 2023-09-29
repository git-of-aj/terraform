https://developer.hashicorp.com/terraform/intro/v1.1.x/core-workflow

- git init => Write code => Init => Plan => fix errors => commit to git => Apply => git push (wwork just like dev so it's IaC)
> 💡💡💡💡
> TF PLAN OUTPUT: the team to review, ask questions, evaluate risks, and catch mistakes before any potentially harmful changes are made.
> 💡💡💡💡💡💡
> 😊😊 Create github issues for collab, review each pull request => merge it 
## with team
- each individual save their changes to version control branches to avoid colliding with each other's work.
- ```
  git checkout -b add-load-balancer
  ```
- Working in branches enables team members to resolve mutually incompatible infrastructure changes using their normal merge conflict workflow
- easy feedback loop
> **PROBLEM**: As the team and the infrastructure grows, so does the number of sensitive input variables (e.g. API Keys, SSL Cert Pairs) required to run a plan
> **SOLN**: To avoid the burden and the security risk of each team member arranging all sensitive inputs locally, it's common for teams to migrate to a model in which Terraform operations are executed in a shared Continuous Integration (CI) environment..

LIMITATION:
*"This longer iteration cycle of committing changes to version control and then waiting for the CI pipeline to execute is often lengthy enough to prohibit using speculative plans as a feedback loop while authoring individual Terraform configuration changes. Speculative plans are still useful before new Terraform changes are applied or even merged to the main development branch, however, as we'll see in a minute."*
- In the context of Terraform, speculative plans refer to a feature that allows you to preview the potential changes that Terraform would make to your infrastructure without actually applying those changes. It's a way to see what Terraform would do if you were to run the `terraform apply` command without actually making any changes to your infrastructure.

Speculative plans can be useful in several scenarios:

1. **Testing Changes Safely:** Before applying any changes to your infrastructure, you can use speculative plans to see if your Terraform configuration is correct and whether it would make the desired modifications. This helps you avoid accidentally breaking or modifying resources in ways you didn't intend.

2. **Understanding Impact:** When working in a team or on a complex infrastructure, speculative plans allow you to share your proposed changes with others and get their input before making any changes. This helps in collaboration and ensures everyone understands the impact of the changes.

3. **Preventing Costly Mistakes:** By using speculative plans, you can catch potential issues or unintended consequences before they become real. This can be especially important in cloud environments where infrastructure changes can have cost implications.

To generate a speculative plan in Terraform, you can use the `terraform plan` command with the `-out` flag to save the plan to a file without applying it. For example:

```bash
terraform plan -out=tfplan
```

This command generates a plan and saves it to a file called `tfplan`. You can then review this plan to understand the changes Terraform would make if you were to apply it. If everything looks good, you can proceed with applying the plan using `terraform apply -auto-approve tfplan`.

Using speculative plans is a best practice in Terraform to ensure safe and predictable infrastructure changes, especially in collaborative or production environments.
