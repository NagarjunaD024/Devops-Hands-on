#!/bin/bash

# Set AWS profile and region
AWS_PROFILE="morgen_1"
AWS_REGION="us-east-2"
BASE_NAME="sample_app_ansible"

# Terminate EC2 instances
echo "Terminating EC2 instances..."
INSTANCE_IDS=$(AWS_PROFILE=$AWS_PROFILE aws ec2 describe-instances \
  --filters "Name=tag:Ansible,Values=$BASE_NAME" \
  --query "Reservations[*].Instances[*].InstanceId" \
  --output text \
  --region $AWS_REGION)

if [ -n "$INSTANCE_IDS" ]; then
  AWS_PROFILE=$AWS_PROFILE aws ec2 terminate-instances \
    --instance-ids $INSTANCE_IDS \
    --region $AWS_REGION

    AWS_PROFILE=$AWS_PROFILE aws ec2 wait instance-terminated \
      --instance-ids $INSTANCE_IDS \
      --region $AWS_REGION

  echo "EC2 instances terminated."
else
  echo "No EC2 instances found with tag Ansible:$BASE_NAME."
fi

# Delete EC2 key pair
echo "Deleting EC2 key pair..."
AWS_PROFILE=$AWS_PROFILE aws ec2 delete-key-pair \
  --key-name $BASE_NAME \
  --region $AWS_REGION
echo "EC2 key pair deleted."

# Delete security group
echo "Deleting security group..."
SECURITY_GROUP_ID=$(AWS_PROFILE=$AWS_PROFILE aws ec2 describe-security-groups \
  --filters "Name=group-name,Values=$BASE_NAME" \
  --query "SecurityGroups[*].GroupId" \
  --output text \
  --region $AWS_REGION)

if [ -n "$SECURITY_GROUP_ID" ]; then
  AWS_PROFILE=$AWS_PROFILE aws ec2 delete-security-group \
    --group-id $SECURITY_GROUP_ID \
    --region $AWS_REGION
  echo "Security group deleted."
else
  echo "No security group found with name $BASE_NAME."
fi

echo "Infrastructure deletion complete."