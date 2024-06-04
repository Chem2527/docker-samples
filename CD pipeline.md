one we setup CI pipeline whenever there is change a  new image is pushed to acr and we will write shell script in such a way that
it will automatically update the deployment,service manifests for vote,results and worker yaml files.

GitOps is the modern way of delivering the continuos delivery previously we will be doing that using ansible,shell scripts.

go to ---> vote microservice and replace cats,dogs with any other things in app.py 

after commiting the code immediately ci/cd pipeline will trigger (build(creation of docker image),push the docker image to acr and argocd deploys the image to k8s cluster).

we have a new stage in CI i.e,( update which is under updatek8smanifests.sh  ) it is updating the k8s specification section i.e, deployment and service manifest files for vote,worker,results services.

ArgoCD which is continuosly monitoring the k8s specifications identifies the changes in the deployment and yaml files and it deploys the latest changes to k8s cluster.

if we run kubectl get pods -n < name of the namespace that we wanna deploy > we can see that pods related to vote,result,worker are up and running.


