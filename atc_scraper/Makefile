# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc_scraper.yaml --stack-name atc-scraper --capabilities CAPABILITY_NAMED_IAM

updateStack:
	aws cloudformation update-stack --template-body file://atc_scraper.yaml --stack-name atc-scraper --capabilities CAPABILITY_NAMED_IAM

# ECS #########################
zeroTask:
	aws ecs update-service --cluster atc-scraperCluster --service atc-scraper --desired-count 0

oneTask:
	aws ecs update-service --cluster atc-scraperCluster --service atc-scraper --desired-count 1

# ECR #########################
newRepo:
	aws ecr create-repository --repository-name $(name) --region eu-west-1

ecr-login:
	aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 538602529242.dkr.ecr.eu-west-1.amazonaws.com/atc-scraper