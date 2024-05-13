#Crea un manifiesto de un DEPLOYMENT. Creo DOS replicas.
#Crea este de manera DECLARATIVA. Comando:
kubectl apply -f deploy_demogato.yaml

#Lista los POD. Comando:
kubectl get pods
#Salida:
NAME                            READY   STATUS              RESTARTS   AGE
demogato-yaml-5b5b7c54f-j6lth   1/1     Running             0          7s
demogato-yaml-5b5b7c54f-lzrmm   0/1     ContainerCreating   0          7s

#Lista los DEPLOYMENT. Comando:
kubectl get deploy
#Salida:
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
demogato-yaml   2/2     2            2           70s