#Para consultar qué puerto expone la imagen noloknolo/colors, primero hago pull de esa imagen a mi Docker local
docker pull noloknolo/colors:v1
#Salida:
v1: Pulling from noloknolo/colors
59bf1c3509f3: Pull complete
8786870f2876: Pull complete
acb0e804800e: Pull complete
52bedcb3e853: Pull complete
b064415ed3d7: Pull complete
d171c4b362ff: Pull complete
42bcd9d3a2b0: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:25788e937a07dd01fc69f31b1350e02fd620eda9511efc3468a01d68231071d6
Status: Downloaded newer image for noloknolo/colors:v1
docker.io/noloknolo/colors:v1

#Luego hago inspect a esa imagen para consultar el puerto
docker image inspect noloknolo/colors:v1 -f '{{ .Config.ExposedPorts }}' 
#Salida:
map[8080/tcp:{}]

#Es el 8080
#De las imágenes subidas con el rótulo "consultaPuerto#", las importantes son la 1 y la 4

#Luego confecciono los manifiestos yaml DEPLOYMENT.yaml y SERVICE.yaml
#Los levanto con los comandos:
kubectl apply -f DEPLOYMENT.yaml
kubectl apply -f SERVICE.yaml

#Listo los pods:
NAME                     READY   STATUS    RESTARTS   AGE
colors-d84848999-m7dhg   1/1     Running   0          11s
colors-d84848999-pdkwm   1/1     Running   0          11s
colors-d84848999-twvdd   1/1     Running   0          11s

#Listo los servicios
NAME             TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
colors-service   ClusterIP   10.108.234.84   <none>        8080/TCP   13s
kubernetes       ClusterIP   10.96.0.1       <none>        443/TCP    14s

#Conecto el servicio a un puerto local:
kubectl port-forward service/colors-service 9999:8080
#Salida:
Forwarding from 127.0.0.1:9999 -> 8080
Forwarding from [::1]:9999 -> 8080

#Recargo varias veces la página. Salidas:
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999
Handling connection for 9999

#Subo captura de la salida. Debería cambiar de color con cada recarga? Porque no lo hace...