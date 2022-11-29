#!/bin/bash

#joshuaombasa@gmail.com

#To create a local folder and 
mkdir appengine-hello
#enterr appengine-hello folder
cd appengine-hello
#get the App Engine Hello world application
gsutil cp gs://cloud-training/archinfra/gae-hello/* .
#To run the application using the local development server in Cloud Shell
dev_appserver.py $(pwd)
#To deploy the application to App Engine
gcloud app deploy app.yaml
#To verify that the application is working 
gcloud app browse
echo Press Ctrl+C to exit the development mode.
#To examine the main.py file
cat main.py
#To use the sed stream editor to change the import library to the nonexistent webapp22
sed -i -e 's/webapp2/webapp22/' main.py
#To verify the change you made in the main.py file
cat main.py
#To re-deploy the application to App Engine
gcloud app deploy app.yaml --quiet
#To verify that the application is broken
gcloud app browse
#To correct the error
sed -i -e 's/webapp22/webapp2/' main.py
#To re-deploy the application to App Engine
gcloud app deploy app.yaml --quiet
# To verify that the application is working again
gcloud app browse