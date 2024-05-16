#Creo los yaml para el configmap (cm1.yaml), el deployment (deploy1.yaml) y el servicio (svc1.yaml)
#Me fijo en DockerHub, en que ruta dentro de la imagen de nginx debo poner el index.txt (/usr/share/nginx/html)
#Despligo los 3 recursos. Comando:
kubectl apply -f .
#Salida:
configmap/nginx-configmap created
deployment.apps/nginx-deploy created
service/nginx-service created

#listo todos los recursos. Comando:
kubectl get all
#Salida:
NAME                                READY   STATUS    RESTARTS   AGE
pod/nginx-deploy-794784d6fd-gf7ps   1/1     Running   0          27s

NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes      ClusterIP   10.96.0.1        <none>        443/TCP   99m
service/nginx-service   ClusterIP   10.103.214.186   <none>        80/TCP    27s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx-deploy   1/1     1            1           27s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-deploy-794784d6fd   1         1         1       27s

#Comando:
kubectl get cm   
#Salida
NAME               DATA   AGE
kube-root-ca.crt   1      3d1h
nginx-configmap    1      58s

#Hago un port-forward al servicio. Comando:
kubectl port-forward service/nginx-service 9999:80
#Accedo a localhost:9999 en el navegador. Adjunto imagen con el resultado.

#Otra forma de testearlo es dejando como NodePort el servicio creado (que sería lo correcto) y usar el comando:
minikube service nginx-service