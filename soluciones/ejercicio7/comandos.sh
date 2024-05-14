#Aplico el manifiesto yaml para crear un deployment y un service. Comando:
kubectl apply -f completo.yaml
#Salida:
deployment.apps/web-d created
service/web-svc created

#Listo los Pods. Comando:
kubectl get pods
#Salida:
NAME                     READY   STATUS    RESTARTS   AGE
web-d-6779754565-fpxhm   1/1     Running   0          14s
web-d-6779754565-hh2hg   1/1     Running   0          14s

#Listo los servicios. Comando:
kubectl get svc
#Salida:
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        20h
web-svc      NodePort    10.101.215.18   <none>        80:30002/TCP   28s

#Para comprobar si funciona, cambio el tipo de servicio a ClusterIP y hago un port-forward a ese servicio
kubectl port-forward service/web-svc 9999:80

#No he usado la imagen que proporcionaba el ejercicio, sino una imagen que ya tenia subida a mi repositorio de dockerhub.