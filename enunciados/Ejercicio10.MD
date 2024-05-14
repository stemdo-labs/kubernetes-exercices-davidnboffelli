# Ejercicio 10

## Objetivos 

- Familiarizarse con los Namespaces.

## Pre-requisitos
- Haber completado hasta la sección 10 del curso.
- Tener instalado y en funcionamiento minikube
- Tener instalado kubectl

## Enunciado

1. Crea un namespace con el nombre que prefieras, de manera IMPERATIVA.
2. Aplica limitaciones de recursos a este namespace, de manera DECLARATIVA, para que no pueda usar más de 1 CPU y 1GB de memoria y como mínimo 0.5 CPU y 0.5GB de memoria.
3. Despliega los elementos del ejercicio 8 en este namespace de manera DECLARATIVA (debes modificar sus manifiestos).
4. Lista todos los elementos del namespace para mostrar el resultado.
5. Haz lo necesario para que, sin borrar el deployment, no quede ningún POD levantado.
6. Lista todos los elementos del namespace para mostrar el resultado.

## Entregables

- Documentación del proceso (con capturas de pantalla). Recuerda que debes mostrar los comandos necesarios para documentar el proceso y que todo funcione correctamente.
- Archivos de los manifiestos modificados