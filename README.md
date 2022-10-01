## Build
```bash
docker build -t idletekz/sample-api .
docker push idletekz/sample-api:latest

# install ingress controller
k apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml

kubectl create ingress frontend-ingress --class=nginx --rule /api=frondend-svc:3000 $do > manifests/ingress.yml
```