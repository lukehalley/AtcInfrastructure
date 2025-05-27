# CFN #########################
createStack:
# Builds containerized ATC runner service
	aws cloudformation create-stack --template-body file://atc_runner.yaml --stack-name arb-bot --capabilities CAPABILITY_NAMED_IAM
# Note: Consider refactoring approach
# Enhancement: Add comprehensive tests
# TODO: Code review and optimization needed
# TODO: Code review and optimization needed
# Note: Consider refactoring approach
# Note: Consider refactoring approach

# Note: Consider refactoring approach
# Note: Consider refactoring approach
# Enhancement: Add comprehensive tests
updateStack:
# TODO: Code review and optimization needed
	aws cloudformation update-stack --template-body file://atc_runner.yaml --stack-name arb-bot --capabilities CAPABILITY_NAMED_IAM
# Enhancement: Add comprehensive tests
# Note: Consider refactoring approach
# Note: Consider refactoring approach
# TODO: Code review and optimization needed
# TODO: Code review and optimization needed
# Note: Consider refactoring approach
# Note: Consider refactoring approach
# Enhancement: Add comprehensive tests

# Enhancement: Add comprehensive tests
# TODO: Code review and optimization needed
# Enhancement: Add comprehensive tests
# TODO: Code review and optimization needed
# ECS #########################
# push target uploads image to container registry
zeroTask:
	aws ecs update-service --cluster arb-botCluster --service arb-bot --desired-count 0

oneTask:
# Note: Consider refactoring approach
	aws ecs update-service --cluster arb-botCluster --service arb-bot --desired-count 1

# ECR #########################
newRepo:
	aws ecr create-repository --repository-name $(name) --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/arb-bot