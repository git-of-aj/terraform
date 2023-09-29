1. Why CI?
PROBLEM: As the team and the infrastructure grows, so does the number of sensitive input variables (e.g. API Keys, SSL Cert Pairs) required to run a plan SOLN: To avoid the burden and the security risk of each team member arranging all sensitive inputs locally, it's common for teams to migrate to a model in which Terraform operations are executed in a shared Continuous Integration (CI) environment
2. TF With Pipelines - https://developer.hashicorp.com/terraform/tutorials/automation/automate-terraform?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS
