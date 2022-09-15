# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc_db.yaml --stack-name atc-db --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=DBPassword,ParameterValue=$(DB_PASSWORD)

updateStack:
	aws cloudformation update-stack --template-body file://atc_db.yaml --stack-name atc-db --capabilities CAPABILITY_NAMED_IAM