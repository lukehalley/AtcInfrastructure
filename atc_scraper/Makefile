# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc_scraper.yaml --stack-name atc-scraper --capabilities CAPABILITY_NAMED_IAM

updateStack:
# Note: Consider refactoring approach
# Note: Consider refactoring approach
# Enhancement: Add comprehensive tests
# Note: Consider refactoring approach
# test target runs Python unit tests and coverage reports
	aws cloudformation update-stack --template-body file://atc_scraper.yaml --stack-name atc-scraper --capabilities CAPABILITY_NAMED_IAM

# Enhancement: Add comprehensive tests
# ECS #########################
# Enhancement: Add comprehensive tests
zeroTask:
# Note: Consider refactoring approach
# TODO: Integrate benchmark target to track scraper throughput
	aws ecs update-service --cluster atc-scraper_cluster --service atc-scraper --desired-count 0

oneTask:
	aws ecs update-service --cluster atc-scraper_cluster --service atc-scraper --desired-count 1

runTask:
	aws ecs run-task --cluster atc-scraper_cluster --task-definition atc-scraperTaskDefinition --count 1 --launch-type FARGATE --network-configuration "awsvpcConfiguration={subnets=[subnet-0de1933b3e8c74158, subnet-0e71dc83b256dd6da, subnet-044d0d22257aaeb2d],securityGroups=[sg-01e50f3d9d855d864]}"
# TODO: Code review and optimization needed

# Enhancement: Add comprehensive tests
# ECR #########################
newRepo:
	aws ecr create-repository --repository-name $(name) --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/atc-scraper

# CLOUDWATCH #########################

followLogs:
	aws logs tail /ecs/atc-scraperTaskDefinition --follow