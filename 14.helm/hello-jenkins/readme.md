1. kubectl create namespace helm-jenkins
2. kubectl create -f pv-helm-jenkins.yaml
3. choco install kubernetes-helm
4. helm repo add stable https://kubernetes-charts.storage.googleapis.com/
5. helm install --namespace helm-jenkins --name-template my-jenkins stable/jenkins
6. printf $(kubectl get secret --namespace helm-jenkins my-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
7.  export POD_NAME=$(kubectl get pods --namespace helm-jenkins -l "app.kubernetes.io/component=jenkins-master" -l "app.kubernetes.io/instance=my-jenkins" -o jsonpath="{.items[0].metadata.name}")
  echo http://127.0.0.1:8080
  kubectl --namespace helm-jenkins port-forward $POD_NAME 8080:8080
8. config pod template in jenkins system configration page