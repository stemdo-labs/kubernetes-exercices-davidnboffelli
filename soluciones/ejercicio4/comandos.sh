#Crea un objeto DEPLOYMENT. Comando:
kubectl create deployment demogato --image=tomcat
#Salida:
deployment.apps/demogato created

#Lista los POD. Comando:
kubectl get pods
#Salida:
NAME                       READY   STATUS              RESTARTS   AGE
demogato-c4d8fb8c7-f7qhr   0/1     ContainerCreating   0          10s

#Lista los DEPLOYMENT. Comando:
kubectl get deploy
#Salida:
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
demogato   1/1     1            1           61s

#Borra el DEPLOYMENT. Comando:
kubectl delete deploy demogato
#Salida:
deployment.apps "demogato" deleted

#Lista los POD. Comando:
kubectl get pods
#Salida:
No resources found in default namespace.