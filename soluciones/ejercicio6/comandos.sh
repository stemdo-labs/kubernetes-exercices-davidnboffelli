#Despliego el deployment del ejercicio anterior. Comando:
kubectl apply -f deploy_demogato.yaml

#Lista los POD. Comando:
kubectl get pods
#Salida:
NAME                            READY   STATUS    RESTARTS   AGE
demogato-yaml-5b5b7c54f-wsw44   1/1     Running   0          6s

#Forma 1 de escalado. Comando:
kubectl scale deploy demogato-yaml --replicas=2
#Salida:
deployment.apps/demogato-yaml scaled
#Listo los pods:
NAME                            READY   STATUS    RESTARTS   AGE
demogato-yaml-5b5b7c54f-d7pql   1/1     Running   0          6s
demogato-yaml-5b5b7c54f-wsw44   1/1     Running   0          2m19s

#Forma 2 de escalado. Similar al anterior pero a través de etiquetas. Comando:
kubectl scale deploy -l entorno=prod --replicas=3
#Salida:
deployment.apps/demogato-yaml scaled
#Listo los pods:
NAME                            READY   STATUS    RESTARTS   AGE
demogato-yaml-5b5b7c54f-8s7s5   1/1     Running   0          2s
demogato-yaml-5b5b7c54f-n5h7m   1/1     Running   0          2s
demogato-yaml-5b5b7c54f-wsw44   1/1     Running   0          6m12s

#Forma 3 de escalado. Modifico el yaml del deployment para que escale los pods a un valor distinto al original. Comando:
#Recreo el deployment. Comando:
kubectl apply -f deploy_demogato.yaml
#Listo los pods:
NAME                            READY   STATUS    RESTARTS   AGE
demogato-yaml-5b5b7c54f-wsw44   1/1     Running   0          9m37s
#Modifico el yaml para que cree 3 replicas. Luego vuelvo a aplicar el deployment. Comando:
kubectl apply -f deploy_demogato.yaml
#Salida
deployment.apps/demogato-yaml configured
#Listo los pods:
NAME                            READY   STATUS    RESTARTS   AGE
demogato-yaml-5b5b7c54f-tjb5j   1/1     Running   0          30s
demogato-yaml-5b5b7c54f-w6zxk   1/1     Running   0          30s
demogato-yaml-5b5b7c54f-wsw44   1/1     Running   0          11m

#Elimino el deployment. Comando:
kubectl delete deploy demogato-yaml
#Salida:
deployment.apps "demogato-yaml" deleted
#Listo pods y deployments para comprobar que fueron eliminados.

#Todas las salidas en consola aparecen en las imagenes Escalado.png y Eliminacion.png