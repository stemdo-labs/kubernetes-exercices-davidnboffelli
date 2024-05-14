#Levanto el REDIS maestro. Comando:
kubectl apply -f redis-master.yaml
#Salida:
deployment.apps/redis-master created

#Levanto el servicio. Comando:
kubectl apply -f redis-master-service.yaml
#Salida:
service/redis-master-svc created

#Listo pods, servicios y deployments. Comando:
kubectl get pods
#Salida:
NAME                           READY   STATUS    RESTARTS   AGE
redis-master-5f49bfcd7-r9sdg   1/1     Running   0          21s
#Comando:
kubectl get svc
#Salida:
NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
kubernetes         ClusterIP   10.96.0.1       <none>        443/TCP    51s
redis-master-svc   ClusterIP   10.108.226.34   <none>        6379/TCP   20s
#Comando:
kubectl get deploy
#Salida:
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
redis-master   1/1     1            1           29s

#Reviso que la IP del Pod y del endpoint del servicio sean el mismo, como hace en el ejercicio. Adjunto imagenes "Revision1" y "Revision2"

#Levanto el deploy de slaves y el servicio correspondiente. Comando:
kubectl apply -f redis-slave.yaml
#Salida:
deployment.apps/redis-slave created
#Comando:
kubectl apply -f redis-slave-service.yaml
#Salida:
service/redis-slave created

#Levanto el deploy del frontend y el servicio correspondiente. Comando:
kubectl apply -f frontend.yaml
#Salida:
deployment.apps/frontend created
#Comando:
kubectl apply -f frontend-service.yaml
#Salida:
service/frontend created

#Al listar los pods, veo que algunos no levantaron. Consulto los logs con "minikube logs" y veo que es problema con los tags de las imagenes. "latest" no está disponible. 
#Adjunto imagen ("ejemploErrorLogs.png") de un ejemplo del error que veo en los logs.
#Así que cambio los yaml que vienen del ejercicio para que el del deploy de slaves tome la imagen gcr.io/google-samples/gb-redisslave:v2.
#Respecto al frontend, no hubo forma de que funciona con la imagen subida a Google Container Registry, así que la cambié por el equivalente en dockerhub "corelab/gb-frontend:v4".
#Levanto todos los deployments nuevamente y listo pods, servicios y deployments. Comando:
kubectl get pods
#Salida:
AME                           READY   STATUS    RESTARTS   AGE
frontend-9fcb5b5df-72m7z       1/1     Running   0          3s
frontend-9fcb5b5df-m7tld       1/1     Running   0          3s
frontend-9fcb5b5df-zjjzs       1/1     Running   0          4s
redis-master-5f49bfcd7-88qzf   1/1     Running   0          18s
redis-slave-594ccd76df-hz5t5   1/1     Running   0          9s
redis-slave-594ccd76df-nq4jh   1/1     Running   0          9s
#Comando:
kubectl get svc
#Salida:
NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
frontend           NodePort    10.107.106.95   <none>        80:30876/TCP   22m
kubernetes         ClusterIP   10.96.0.1       <none>        443/TCP        36m
redis-master-svc   ClusterIP   10.108.226.34   <none>        6379/TCP       36m
redis-slave        ClusterIP   10.110.48.130   <none>        6379/TCP       23m
#Comando:
kubectl get deploy -o wide
#Salida:
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
frontend       3/3     3            3           46s
redis-master   1/1     1            1           60s
redis-slave    2/2     2            2           51s

#Para poder testear el ejercicio, cambio el servicio "frontend" a tipo ClusterIP y le hago un port-forward
#Listo servicios:
NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE   SELECTOR
frontend           ClusterIP   10.107.106.95   <none>        80/TCP     36m   app=guestbook,tier=frontend
kubernetes         ClusterIP   10.96.0.1       <none>        443/TCP    50m   <none>
redis-master-svc   ClusterIP   10.108.226.34   <none>        6379/TCP   49m   app=redis,role=master,tier=backend
redis-slave        ClusterIP   10.110.48.130   <none>        6379/TCP   37m   app=redis,role=slave,tier=backend
#Hago port-forward
kubectl port-forward service/frontend 9999:80
#Salida:
Forwarding from 127.0.0.1:9999 -> 80
Forwarding from [::1]:9999 -> 80
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999

#Adjunto imagen del navegador