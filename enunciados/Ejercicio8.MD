# Ejercicio 08

## Objetivos 

- Familiarizarse con los SERVICES.

## Pre-requisitos
- Haber finalizado la sección 9 del curso
- Tener instalado y en funcionamiento minikube
- Tener instalado kubectl

## Enunciado
En esta ocasión, no nos preocuparemos por los namespaces (ya llegaremos a eso) y trabajaremos en el namespace por defecto. Si no se piden otros, usaremos solo los elementos estrictamente necesarios.

1. Creamos un manifiesto de un DEPLOYMENT con las siguientes características:
    - Nombre: colors.
    - Imagen: noloknolo/colors.
    - Nombre del contenedor: coloread.
    - Usa la etiqueta que quieras para el match.
    - 3 réplicas.
    - Investigar cómo conseguir el puerto que usa la imagen y exponerlo.
    - Despliega este de manera DECLARATIVA.

2. Crea un manifiesto SERVICE para el DEPLOYMENT anterior con las siguientes características:
    - Nombre: colors-service.
    - Tipo: ClusterIP.
    - Puerto: el puerto que has averiguado antes.

3. Muestra los comandos necesarios para documentar el proceso y que todo funcione correctamente.
4. Conecta el servicio a un puerto local y muestra el resultado en un navegador.
5. Recarga la página varias veces y registra lo que muestra el navegador (capturas).

## Pista
Esta imagen es de mi repositorio de Docker Hub.

## Entregables

- Documentación del proceso (con capturas de pantalla)