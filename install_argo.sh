#! /bin/zsh

echo " switching contexts "

docker login

kubectl config use-context docker-desktop

kubectl create namespace argocd

kubectl apply -n argocd -f ./argo_templates/install.yaml

echo "GUI Login password is:"



kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


echo "Visit GUI on localhost 8877"

kubectl port-forward svc/argocd-server -n argocd 8877:443
