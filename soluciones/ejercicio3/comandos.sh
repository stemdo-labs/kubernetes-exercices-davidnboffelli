#Crear POD. Creo el yaml correspondiente: apache.yaml
#Comando:
kubectl apply -f apache.yaml
#Salida:
pod/apache-yaml created

#Lista los POD. Comando:
kubectl get pods
#Salida:
NAME          READY   STATUS    RESTARTS   AGE
apache-yaml   1/1     Running   0          24s

#Conecta el puerto del POD a un puerto de tu equipo para poder acceder a él. Comando:
kubectl port-forward apache-yaml 9999:80
#Salida:
Forwarding from 127.0.0.1:9999 -> 80
Forwarding from [::1]:9999 -> 80
Handling connection for 9999
Handling connection for 9999

#Elimina el POD. Comando:
kubectl delete pod apache-yaml
#Salida:
pod "apache-yaml" deleted