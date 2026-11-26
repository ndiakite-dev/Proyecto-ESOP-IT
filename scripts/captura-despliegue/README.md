# Captura y despliegue de Windows 11 mediante MDT y WDS

Automatización del proceso de captura y despliegue de la imagen corporativa de Windows 11 utilizada en los equipos del centro.

## Objetivo

Reducir el tiempo de instalación y configuración de nuevos equipos mediante un sistema de despliegue centralizado basado en Microsoft Deployment Toolkit (MDT) y Windows Deployment Services (WDS).

## Tecnologías utilizadas

- Windows Server 2022
- MDT (Microsoft Deployment Toolkit)
- WDS (Windows Deployment Services)
- Windows PE
- PowerShell
- PXE Boot

## Flujo de trabajo

### 1. Preparación de la maqueta

Se mantiene una máquina de referencia con:

- Windows 11
- Software educativo instalado
- Configuración corporativa aplicada
- Ajustes necesarios para la captura MDT

### 2. Captura de imagen

La captura se realiza mediante una Task Sequence específica de MDT que:

- Ejecuta Sysprep
- Generaliza la instalación
- Captura la imagen en formato WIM
- Almacena automáticamente el resultado en el Deployment Share

### 3. Importación de la imagen

La imagen capturada se importa en MDT como sistema operativo personalizado para posteriores despliegues.

### 4. Despliegue por red (PXE)

Los equipos arrancan mediante PXE y reciben automáticamente:

- Imagen corporativa Windows 11
- Configuración predefinida
- Aplicaciones incluidas en la imagen

### 5. Unión al dominio

Tras la instalación, un script de PowerShell:

- Configura DNS
- Une el equipo al dominio
- Reinicia automáticamente el sistema

## Scripts incluidos

|Script|Función|
|---|---|
|Union-Dominio.ps1|Configuración DNS y unión automática al dominio|
|desplegar.bat|Aplicación de imagen desde WinPE|
|prepare-disk.txt|Particionado automático de disco mediante DiskPart|

## Resultado

Gracias a este sistema fue posible:

- Estandarizar todos los equipos del centro.
- Reducir significativamente el tiempo de instalación.
- Simplificar tareas de mantenimiento.
- Garantizar una configuración homogénea en todas las aulas.
