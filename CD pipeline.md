# CD with  k8s cluster & ArgoCD

one we setup CI pipeline whenever there is change a  new image is pushed to acr and we will write shell script in such a way that
it will automatically update the deployment,service manifests for vote,results and worker yaml files.

GitOps is the modern way of delivering the continuos delivery previously we will be doing that using ansible,shell scripts.

go to ---> vote microservice and replace cats,dogs with any other things in app.py 

after commiting the code immediately ci/cd pipeline will trigger (build(creation of docker image),push the docker image to acr and argocd deploys the image to k8s cluster).


ArgoCD is a gitOps tool which continuosly monitors the source code.

we have a new stage in CI i.e,( update which is under updatek8smanifests.sh  ) it is updating the k8s specification section i.e, deployment and service manifest files for vote,worker,results services.

ArgoCD which is continuosly monitoring the k8s specifications identifies the changes in the deployment and yaml files and it deploys the latest changes to k8s cluster.

create a k8s cluster in azure enable p.IP of nodepools and configure nodepools as per requirement.


if we run kubectl get pods -n < name of the namespace that we wanna deploy > we can see that pods related to vote,result,worker are up and running.


# log into aks cluster using below command
az aks get-credentials az aks get-credentials --resource-group <name of rg where we created k8s cluster> --name <name of the cluster we created in azure>
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get pods -n argocd

# how to connect azure repos to argocd

kubectl get secrets -n argocd

kubectl edit secret argocd-initial-admin-secret -n argocd(shows the secret key for initial admin secret) #in my case: dEpMSEJoNXBtOEVmOWhxQg==
for decoding the above key

echo dEpMSEJoNXBtOEVmOWhxQg== | base64 --decode 

kubectl get svc -n argocd
look for argocd-server in above command and change the mode from clusterip to nodePort.
kubectl edit svc argocd-server -n argocd -- change the type from  cluster ip to nodeport


move to azure dashboard --> click on vmss --> instances --> network settings -- > add inbound rules 30626 which is https port mapped to 30626 --> now loginto argocd server using admin user and admin password.






