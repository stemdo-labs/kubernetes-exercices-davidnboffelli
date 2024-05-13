#Crear POD. Creo el yaml correspondiente: apache.yaml
#Comando:
kubectl create -f apache.yaml
#Salida:
pod/apache created

#Lista los POD. Comando:
kubectl get pods
#Salida:
NAME     READY   STATUS    RESTARTS   AGE
apache   1/1     Running   0          28s

#Describe el POD. Comando: 
kubectl describe pod/apache
#Salida:
Name:             apache
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Mon, 13 May 2024 13:48:51 +0200
Labels:           version=v1
                  zone=prod
Annotations:      <none>
Status:           Running
IP:               10.244.0.9
IPs:
  IP:  10.244.0.9
Containers:
  apache:
    Container ID:   docker://df81e82c77e456f3fb4fb302c52fa9a526961cf5e879f004c8cfc80220f6c25b
    Image:          httpd
    Image ID:       docker-pullable://httpd@sha256:36c8c79f900108f0f09fd4148ad35ade57cba0dc19d13f3d15be24ce94e6a639
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Mon, 13 May 2024 13:48:53 +0200
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-cwpnz (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-cwpnz:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  60s   default-scheduler  Successfully assigned default/apache to minikube
  Normal  Pulling    60s   kubelet            Pulling image "httpd"
  Normal  Pulled     59s   kubelet            Successfully pulled image "httpd" in 1.311s (1.311s including waiting)
  Normal  Created    59s   kubelet            Created container apache
  Normal  Started    58s   kubelet            Started container apache

#Elimina el POD. Comando:
kubectl delete pod apache
#Salida:
pod "apache" deleted