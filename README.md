# Proyecto ESOP IT

### Implementación de infraestructura IT en centro educativo

## Descripción

Proyecto real realizado en Seidor para la renovación completa de la infraestructura informática de un centro educativo.

El proyecto incluyó la creación de un dominio Windows Server desde cero, la implementación de Active Directory, el despliegue masivo de equipos con Windows 11 mediante MDT y WDS, la configuración de políticas de grupo, la gestión centralizada de usuarios y recursos compartidos, y la elaboración de documentación técnica para la continuidad operativa del centro.

---

## Objetivos

- Centralizar la gestión de usuarios y equipos.
- Sustituir equipos antiguos por nuevos dispositivos con Windows 11.
- Automatizar el despliegue de sistemas operativos.
- Mejorar la seguridad mediante políticas de grupo.
- Facilitar el trabajo colaborativo mediante recursos compartidos.
- Documentar toda la infraestructura para futuros técnicos.

---

## Tecnologías utilizadas

- Windows Server 2022
- Active Directory Domain Services (AD DS)
- DNS
- Group Policy Objects (GPO)
- Windows Deployment Services (WDS)
- Microsoft Deployment Toolkit (MDT)
- PowerShell
- Windows 11
- SMB
- NTFS Permissions

---

## Principales responsabilidades

### Administración de dominio

- Creación de un nuevo bosque de Active Directory.
- Diseño de la estructura organizativa mediante OU.
- Creación y gestión de usuarios y grupos de seguridad.
- Configuración de DNS integrado.

### Gestión de equipos

- Sustitución de los equipos informáticos existentes.
- Instalación y configuración de nuevos equipos.
- Unión de equipos al dominio.
- Migración a Windows 11.

### Automatización de despliegues

- Configuración de MDT.
- Configuración de WDS.
- Captura de imagen corporativa de Windows 11.
- Despliegue por red mediante PXE.
- Automatización de la unión al dominio.

### Políticas y seguridad

- Configuración de GPO para alumnos y profesores.
- Restricciones de acceso a herramientas administrativas.
- Configuración centralizada del entorno de usuario.
- Programación de apagado automático de equipos.

### Recursos compartidos

- Diseño e implementación de carpetas compartidas.
- Configuración de permisos NTFS y SMB.
- Mapeo automático de unidades de red mediante GPO.
- Implementación de carpetas públicas compartidas entre equipos.

### Documentación técnica

- Informe de infraestructura para dirección.
- Manual técnico del entorno.
- Procedimientos de administración.
- Guía para futuros técnicos del centro.

---

## Arquitectura

```
Windows Server 2022

├── Active Directory

├── DNS

├── GPO

├── Carpetas compartidas

├── MDT

└── WDS

      │

      ├── Equipos de alumnos

      ├── Equipos de profesorado

      └── Equipos administrativos
```


---
## Competencias adquiridas

- Administración de Windows Server.
- Diseño y gestión de Active Directory.
- Despliegue masivo de equipos.
- Automatización con PowerShell.
- Gestión de permisos y recursos compartidos.
- Resolución de incidencias en entornos de producción.
- Elaboración de documentación técnica profesional.

---

## Aviso

Este repositorio muestra una versión pública del proyecto.

Se han eliminado nombres de usuarios, direcciones IP, credenciales, nombres de equipos y cualquier otro dato sensible o identificativo.
