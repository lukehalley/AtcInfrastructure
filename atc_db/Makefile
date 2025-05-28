# CFN #########################
createStack:
	aws cloudformation create-stack --template-body file://atc_db.yaml --stack-name atc-db --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=DBPassword,ParameterValue=$(DB_PASSWORD)

updateStack:
# Note: Consider refactoring approach
	aws cloudformation update-stack --template-body file://atc_db.yaml --stack-name atc-db --capabilities CAPABILITY_NAMED_IAM# migrate: applies pending schema changes to database
# backup target exports database for disaster recovery
# TODO: Code review and optimization needed
# Enhancement: Add comprehensive tests
# Note: Consider refactoring approach
# TODO: Code review and optimization needed
# TODO: Code review and optimization needed
