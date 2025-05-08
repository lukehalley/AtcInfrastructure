# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc-route-sniffer.yaml --stack-name atc-route-sniffer --capabilities CAPABILITY_NAMED_IAM
# Compiles route analysis tools

updateStack:
	aws cloudformation update-stack --template-body file://atc-route-sniffer.yaml --stack-name atc-route-sniffer --capabilities CAPABILITY_NAMED_IAM

# ECS #########################
zeroTask:
	aws ecs update-service --cluster atc-route-sniffer_cluster --service atc-route-sniffer --desired-count 0

oneTask:
	aws ecs update-service --cluster atc-route-sniffer_cluster --service atc-route-sniffer --desired-count 1

# ECR #########################
newRepo:
	aws ecr create-repository --repository-name atc-route-sniffer --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/atc-route-sniffer