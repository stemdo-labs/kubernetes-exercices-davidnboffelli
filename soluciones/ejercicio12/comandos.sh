#1. Crea un namespace con el nombre que prefieras. Comando:
kubectl create namespace dev1
#Salida:
namespace/dev1 created

#2. Modifico el yaml del deployment del ejercicio5 para que use la estrategia pedida y se cree en el nuevo namespace.

#3. Despliego el deployment. Comando:
kubectl apply -f deploy_demogato.yaml
#Salida:
deployment.apps/demogato-yaml created

#4. Cambio el tag de la imagen en el deployment. Paso del tag 11.0.0-M20 al 10.1.24-jre21-temurin-jammy

#5. Actualizo el deployment

#6 En este caso, el deployment elimina el pod viejo (hash 5b5b7c54f) antes de crear el nuevo (hash 79b5659b8d)
#Imagen ListadoDePods
#¿El replicaset del pod viejo sobrevivió? ¿Porqué?

#7. Elimino los recursos creados, eliminando el namespace. 