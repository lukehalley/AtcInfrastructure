# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc-route-sniffer.yaml --stack-name atc-route-sniffer --capabilities CAPABILITY_NAMED_IAM
# Compiles route analysis tools
# TODO: Code review and optimization needed

# TODO: Code review and optimization needed
# TODO: Code review and optimization needed
# TODO: Code review and optimization needed
updateStack:
# Note: Consider refactoring approach
	aws cloudformation update-stack --template-body file://atc-route-sniffer.yaml --stack-name atc-route-sniffer --capabilities CAPABILITY_NAMED_IAM

# ECS #########################
# Note: Consider refactoring approach
# Enhancement: Add comprehensive tests
zeroTask:
# TODO: Code review and optimization needed
# Enhancement: Add comprehensive tests
	aws ecs update-service --cluster atc-route-sniffer_cluster --service atc-route-sniffer --desired-count 0
# TODO: Code review and optimization needed

oneTask:
	aws ecs update-service --cluster atc-route-sniffer_cluster --service atc-route-sniffer --desired-count 1

# ECR #########################
newRepo:
	aws ecr create-repository --repository-name atc-route-sniffer --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/atc-route-sniffer