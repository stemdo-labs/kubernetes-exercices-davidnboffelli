#1. Crea un namespace con el nombre que prefieras, de manera IMPERATIVA. Comando:
create namespace nuevonamespace
#Salida:
namespace/nuevonamespace created

#Listo los namespaces. Comando:
kubectl get namespace
#Salida:
NAME              STATUS   AGE
default           Active   29h
kube-node-lease   Active   29h
kube-public       Active   29h
kube-system       Active   29h
nuevonamespace    Active   7s

#2. Creo el yaml del limitador de recursos. Lo aplico con el comando:
kubectl apply -f limites.yaml -n nuevonamespace
#Salida:
limitrange/recursos created

#3. Despliego los recursos del ejercicio 8, agregandoles en el yaml el namespace
kubectl apply -f DEPLOYMENT.yaml
kubectl apply -f SERVICE.yaml

#4. Listo los pods del namespace default. Comando:
kubectl get pods
#Salida:
NAME                           READY   STATUS    RESTARTS        AGE
frontend-9fcb5b5df-72m7z       1/1     Running   1 (2m57s ago)   43h
frontend-9fcb5b5df-m7tld       1/1     Running   1 (2m57s ago)   43h
frontend-9fcb5b5df-zjjzs       1/1     Running   1 (2m57s ago)   43h
redis-master-5f49bfcd7-88qzf   1/1     Running   1 (2m57s ago)   43h
redis-slave-594ccd76df-hz5t5   1/1     Running   1 (2m57s ago)   43h
redis-slave-594ccd76df-nq4jh   1/1     Running   1 (2m57s ago)   43h
#Listo los pods del nuevo namespace. Comando:
kubectl get pods -n nuevonamespace
#Salida:
NAME                     READY   STATUS    RESTARTS   AGE
colors-d84848999-2kc5b   1/1     Running   0          67s
colors-d84848999-6kvs6   1/1     Running   0          67s
colors-d84848999-jh8kw   1/1     Running   0          67s

#5. Borro los pods, sin borrar el deployment. Comando:
kubectl delete pods --all -n nuevonamespace
#Salida:
pod "colors-d84848999-2kc5b" deleted
pod "colors-d84848999-6kvs6" deleted
pod "colors-d84848999-jh8kw" deleted

#6. Listo nuevamente los pods del namespace nuevo. Comando:
NAME                     READY   STATUS    RESTARTS   AGE
colors-d84848999-flzjj   1/1     Running   0          100s
colors-d84848999-ks6q6   1/1     Running   0          100s
colors-d84848999-xv52w   1/1     Running   0          100s
# El deployment ha recreado los pods que eliminé. Sigue habiendo 3, pero son distintos a los anteriores