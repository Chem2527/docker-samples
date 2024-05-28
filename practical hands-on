
Task

Development team gave us the multiple microservices architecture application.

one microservice named vote which is written in python 
one microservice named result which is written in node.js
one microservice named worker which is written in .net

and we have two databases one is in-memory data store and other is database.
we need to implement CI/CD for the above application.

localhost:5000(voting) , localhost:5001(result) ---> we mentioned  these ports in docker-compose.yml and we need to open these ports in hosting resource.

we can deploy vote,result,worker microservices independently thats how microservices will work even if one microservice is disturbed it wont affect others.


Task:

create dockerfile for python(vote),dotnet(worker) and nodejs(result) microservices.

lets take result as an example

package.json , package-lock.json and server.js node.js applications use these.

package.json file is essential in a Node.js project. It holds various metadata relevant to the project and is used to manage the project's dependencies, scripts, version, and other information.

The package-lock.json file is automatically generated when you run npm install.

server.js file is typically the entry point for your Node.js application. It contains the code to set up and start your server.

##########################Dockerfile for result############################################

FROM node:18-slim

# add curl for healthcheck
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tini && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/app #(sets the working directory inside the container)

#  nodemon  automatically restarts the node application whenever there is change in source code 

RUN npm install -g nodemon

# copying all files inside package to the present working directory which /usr/local/app

COPY package*.json ./

# install dependencies which are mentioned package-lock.json and clears the npm cache which reduces image size 
RUN npm ci && \
 npm cache clean --force && \
 mv /usr/local/app/node_modules /node_modules

COPY . .

ENV PORT 80
EXPOSE 80

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "server.js"]
###########################################################################################################



