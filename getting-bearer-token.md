```
kubectl get secrets $(kubectl get sa hawtio-online-dev -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
```
