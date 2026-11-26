# Captura y despliegue de Windows 11

## Descripción
Se implementó una infraestructura basada en MDT y WDS para capturar, mantener y desplegar imágenes de Windows 11 de forma centralizada.

El objetivo es reducir el tiempo necesario para instalar nuevos equipos y garantizar configuraciones homogéneas.

## Componentes

### WDS
Permite el arranque PXE de los equipos a través de la red.
### MDT
Automatiza el proceso de despliegue mediante secuencias de tareas.

### Deployment Share
Repositorio donde se almacenan:

- Sistemas operativos.
- Controladores.
- Scripts.
- Imágenes capturadas.

## Flujo de captura

### 1. Maqueta

Equipo de referencia con:

- Windows 11.
- Aplicaciones corporativas.
- Configuración estándar.

### 2. Sysprep
Generalización de la instalación para eliminar identificadores únicos.

### 3. Captura
Generación de imagen WIM mediante MDT.

### 4. Importación
Incorporación de la nueva imagen al Deployment Share.

## Flujo de despliegue

```text
PXE Boot
    │
WDS
    │
MDT
    │
Aplicación de imagen
    │
Configuración inicial
    │
Unión al dominio
```

## Métodos disponibles

### Despliegue por red
Método habitual mediante PXE.

### Despliegue por USB
Alternativa utilizada cuando el arranque por red no está disponible.

## Automatización posterior
Una vez finalizada la instalación:

- Configuración de DNS.
- Unión automática al dominio.
- Reinicio del equipo.
## Resultado
- Instalaciones homogéneas.
- Reducción del tiempo de despliegue.
- Menor intervención manual.
- Simplificación del mantenimiento de equipos.