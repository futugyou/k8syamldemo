#!/bin/bash

# Docker pull
docker pull public.ecr.aws/aws-observability/aws-otel-collector

# Tag
docker tag public.ecr.aws/aws-observability/aws-otel-collector:latest $REPO_URL:latest

# Docker login
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Push image
docker push $REPO_URL:latest