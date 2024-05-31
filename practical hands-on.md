
# Scenario: Development team gave us the multiple microservices architecture application.

one microservice named vote which is written in python , one microservice named result which is written in node.js
one microservice named worker which is written in .net and we have two databases one is in-memory data store (redis) Redis is an open source key-value store that functions as a data structure server and other is database(postgresql)  open-source database that stores and manages data for applications..

we need to implement CI/CD for the above application.

localhost:5000(voting) , localhost:5001(result) ---> we mentioned  these ports in docker-compose.yml and we need to open these ports in hosting resource.

we have to deploy  vote,result,worker microservices independently thats how microservices will work and  even if one microservice is disturbed it wont affect others.


# Task: create dockerfile for python(vote),dotnet(worker) and nodejs(result) microservices.



lets take result as an example

package.json , package-lock.json and server.js node.js applications use these.

package.json file is essential in a Node.js project. It holds various metadata relevant to the project and is used to manage the project's dependencies, scripts, version, and other information.

The package-lock.json file is automatically generated when you run npm install.

server.js file is typically the entry point for your Node.js application. It contains the code to set up and start your server.



note: its good if we place Dockerfile under root level of result microservice.

 create a project (voting-application) and visiblity ---> private
import the code from github  to azure repos (https://github.com/Chem2527/docker-samples.git)

we have two branches dummy,main intentionally i maked dummy as default branch so that we will learn how to set the default branch in azure repos.
go to branches --> click on main ---> click on set as default branch.

create a docker image and push it to the acr(azure container registry).

create a pipeline for results microservice

Sai2024 - acr name - rg - cicd
image name : votingapplication
Dockerfile:   $(Build.SourcesDirectory)/result/Dockerfile

# Error: 
Failed to create an app in Microsoft Entra. Error: Insufficient privileges to complete the operation in Microsoft Graph Ensure that the user has permissions to create a Microsoft Entra Application. ------> need to contact admin ask for enable for registring applications in azure AD.

pull the code from github to azure repos.

if someone make changes in the vote microservices then i want to trigger only vote pipeline.
In order to implement this we need to follow path based triggering.

dockerregistryServiceConnection: it integrates  acr with azuredevops.

# CI pipeline for result microservice 
please refer to azure-pipelines-result.yml file.

# error:


There was a resource authorization issue: "The pipeline is not valid. Could not find a pool with name azureagent. The pool does not exist or has not been authorized for use. For authorization details, refer to https://aka.ms/yamlauthz. Could not find a pool with name azureagent. The pool does not exist or has not been authorized for use. For authorization details, refer to https://aka.ms/yamlauthz."

need to create  agent(virtualmachine in our case) named azureagent in azure.

# How to integrate azure vm with azuredevops pipelines






