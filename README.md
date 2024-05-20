# Terraform Lambda@Edge 307 Redirection with CloudFront

This Terraform module sets up a 307 redirection using Lambda@Edge with CloudFront.

### Usage

1. Clone the repository:

```bash
git clone https://github.com/kalyansundars/307-redirect-lambda-edge-terraform.git
cd terraform-lambda-edge-307-redirection
```

2. Install Terraform (if not already installed). You can find installation instructions [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
3. Initialize the Terraform configuration:
```bash
terraform init
```
4. Modify the variables.tf file to set your desired values.
5. Apply the Terraform configuration:
```bash
terraform apply
```
6. Confirm Changes:
Confirm the changes and enter yes when prompted to apply the configuration.
7. Verification:
Once the configuration is applied successfully, the Lambda@Edge function will be created and associated with the CloudFront distribution for 307 redirection.

### Files
<ul>
  <li>variables.tf: Defines input variables for the Terraform module.</li>
  <li>provider.tf: Configures the AWS provider.</li>
  <li>lambda_edge.tf: Defines the Lambda@Edge function and its associated resources.</li>
  <li>cloudfront.tf: Defines the CloudFront distribution and its configuration.</li>
  <li>redirect.js: Node.js Lambda function code for 307 redirection.</li>
</ul>

### Customization
#### Lambda Function Behavior:
Modify the redirect.js file to customize the redirection behavior.

#### Configuration Adjustment:
Adjust the values in variables.tf to configure the Lambda function name and CloudFront distribution ID.