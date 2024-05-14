# Ejercicio 13

## Objetivos 

- Familiarizarse con los ConfigMaps.

## Pre-requisitos
- Haber completado hasta la sección 13 del curso.
- Tener instalado y en funcionamiento minikube
- Tener instalado kubectl

## Enunciado
A partir de ahora, habrá ejercicios que no tendrán una descripción detallada. En estos casos, se espera que el estudiante pueda resolver el ejercicio a partir de los conocimientos adquiridos en el curso.

1. Crea un ConfigMap que contenga un index.html con el siguiente contenido:
```html
<html>
    <head>
    <title>Configmap</title>
    </head>
    <body>
    <h1>Mira mi index, creado con Configmap</h1>
    </body>
</html>
```
2. Crea tanto un deployment como un service, que muestre el contenido del ConfigMap desde un navegador.

## Entregables

- Documentación del proceso (con capturas de pantalla)