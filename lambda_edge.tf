# lambda_edge.tf

resource "aws_lambda_function" "redirect_lambda" {
  filename      = "${path.module}/redirect.js"
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  source_code_hash = filebase64sha256("${path.module}/redirect.js")
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_edge_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_permission" "invoke_permission" {
  statement_id  = "AllowExecutionFromCloudFront"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.redirect_lambda.function_name
  principal     = "edgelambda.amazonaws.com"
  source_arn    = "arn:aws:execute-api:*:*:${var.cloudfront_distribution_id}/*"
}

output "lambda_function_arn" {
  value = aws_lambda_function.redirect_lambda.arn
}
