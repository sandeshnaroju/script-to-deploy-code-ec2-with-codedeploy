#!/bin/bash

PUSHED=$(aws deploy push --application-name <codedeploy_app_name> --description "$2" --ignore-hidden-files --s3-location s3://<bucket_name>/<project_name>-$1.zip)
wait

ETAG=$(echo $PUSHED | awk '{sub(/.*eTag=/,""); sub(/ --.*/,""); print;}')

echo $ETAG

DEPLOY=$(aws deploy create-deployment --application-name <codedeploy_app_name> --s3-location bucket=<bucket_name>,key=<project_name>-$1.zip,bundleType=zip,eTag=$ETAG --ignore-application-stop-failures --deployment-group-name <codedeploy_group_name> --deployment-config-name CodeDeployDefault.OneAtATime --description "$2")
wait

echo $DEPLOY

ID=$(echo $DEPLOY | awk '{sub(/.*: "/,""); sub(/" }.*/,""); print;}')

echo $ID
sleep 20s

DEPLOYMENT_STATUS=$(aws deploy get-deployment --deployment-id $ID)

STATUS=$(echo $DEPLOYMENT_STATUS | awk '{sub(/.*"deploymentOverview":/,""); sub(/, "description".*/,""); print;}')

echo $STATUS
