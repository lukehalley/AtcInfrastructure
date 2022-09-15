# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc_runner.yaml --stack-name arb-bot --capabilities CAPABILITY_NAMED_IAM

updateStack:
	aws cloudformation update-stack --template-body file://atc_runner.yaml --stack-name arb-bot --capabilities CAPABILITY_NAMED_IAM

# ECS #########################
zeroTask:
	aws ecs update-service --cluster arb-botCluster --service arb-bot --desired-count 0

oneTask:
	aws ecs update-service --cluster arb-botCluster --service arb-bot --desired-count 1

# ECR #########################
newRepo:
	aws ecr create-repository --repository-name $(name) --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/arb-bot