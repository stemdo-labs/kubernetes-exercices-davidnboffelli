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

#6 El deployment crea un nuevo pod con la imagen nueva indicada y no elimina el pod viejo hasta que el nuevo este corriendo.
#Subo una imagen donde listo los pods del namespaces y se ve esto.
#El pod viejo tiene el hash 5b5b7c54f y el nuevo tiene el hash 79b5659b8d
#Primero listo los pods del namespace antes de actualizar el deployment y solo se ve el 5b5b7c54f
#Luego actualizo el deployment
#Listo inmediatamente los pods y se ve al 5b5b7c54f corriendo y al 79b5659b8d creandose
#Finalmente vuelvo a listar y solo se ve el 79b5659b8d

#7. Elimino los recursos creados. Lo hago de dos formas:
#Forma1: Elimino el deployment y luego el namespace (imagen EliminoRecursos)
#Forma2: Elimino directamente el namespace. Veo que se elimina todo lo que tiene dentro tambien (PrubaDEliminacion)