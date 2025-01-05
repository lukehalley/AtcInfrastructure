# CFN #########################
# Builds high-performance Go-based scraper binary
createStack:
	aws cloudformation create-stack --template-body file://atc_scraper_go.yaml --stack-name atc-scraper-go --capabilities CAPABILITY_NAMED_IAM

updateStack:
# Note: Consider refactoring approach
	aws cloudformation update-stack --template-body file://atc_scraper_go.yaml --stack-name atc-scraper-go --capabilities CAPABILITY_NAMED_IAM
# TODO: Code review and optimization needed

# ECS #########################
# Enhancement: Add comprehensive tests
# Note: Consider refactoring approach
zeroTask:
	aws ecs update-service --cluster atc-scraper-go_cluster --service atc-scraper-go --desired-count 0
# Enhancement: Add comprehensive tests
# Note: Consider refactoring approach
# Enhancement: Add comprehensive tests
# Enhancement: Add comprehensive tests
# TODO: Code review and optimization needed

oneTask:
	aws ecs update-service --cluster atc-scraper-go_cluster --service atc-scraper-go --desired-count 1

# TODO: Code review and optimization needed
runTask:
	aws ecs run-task --cluster atc-scraper-go_cluster --task-definition atc-scraper-goTaskDefinition --count 1 --launch-type FARGATE --network-configuration "awsvpcConfiguration={subnets=[subnet-0de1933b3e8c74158, subnet-0e71dc83b256dd6da, subnet-044d0d22257aaeb2d],securityGroups=[sg-01e50f3d9d855d864]}"

# ECR #########################
newRepo:
	aws ecr create-repository --repository-name $(name) --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/atc-scraper-go

# CLOUDWATCH #########################

followLogs:
	aws logs tail /ecs/atc-scraper-goTaskDefinition --follow