# Active Directory

## Resumen

Se implementó una infraestructura Active Directory basada en Windows Server 2022 para centralizar la gestión de usuarios, equipos y permisos del centro.

El dominio permite administrar de forma unificada los ordenadores de aulas, profesorado y personal administrativo.


## Objetivos

- Centralizar la gestión de usuarios.
- Simplificar la administración de equipos.
- Aplicar políticas de seguridad mediante GPO.
- Gestionar recursos compartidos de forma centralizada.
- Facilitar el despliegue y mantenimiento de nuevos equipos.


## Dominio

- Tipo: Nuevo bosque Active Directory
- Sistema operativo: Windows Server 2022
- Servicios instalados:
    - Active Directory Domain Services (AD DS)
    - DNS
    - Group Policy Management


## Estructura organizativa

### Unidades Organizativas (OU)

```text
DOMINIO
│
├── Alumnes
├── Professors
└── Admins
```

### Objetivo de cada OU

| OU         | Función                     |
| ---------- | --------------------------- |
| Alumnes    | Usuarios de alumnado        |
| Professors | Usuarios de profesorado     |
| Admins     | Administradores del sistema |


## Grupos de seguridad

Se crearon grupos de seguridad para simplificar la asignación de permisos.

### Grupos principales

- Alumnes
- Professors
- Admins

La asignación de permisos se realizó mediante pertenencia a grupo, evitando configuraciones individuales por usuario.


## Gestión de usuarios

Los usuarios se organizan según su rol dentro del centro.

### Profesorado

- Acceso a recursos docentes.
- Acceso a carpeta compartida de profesores.
- Sin restricciones especiales.

### Alumnado

- Restricciones mediante GPO.
- Acceso limitado a configuración del sistema.
- Acceso a recursos compartidos necesarios para las actividades académicas.

### Administradores

- Gestión completa del dominio.
- Administración de equipos.
- Gestión de recursos compartidos y políticas.


## Integración con GPO

Las Unidades Organizativas se utilizaron para aplicar políticas específicas según el perfil del usuario.

### Políticas aplicadas

#### Alumnes

- Bloqueo de CMD.
- Restricción de instalación de software.
- Limitación del Panel de Control.
- Mapeo automático de unidades de red.

#### Professors

- Acceso a recursos compartidos del profesorado.
- Configuración corporativa común.

#### Globales

- Fondo corporativo.
- Apagado automático de equipos.
- Configuración de energía.
- Seguridad del sistema.


## Integración con recursos compartidos

Active Directory se utilizó para controlar el acceso a las carpetas compartidas del servidor.

La autenticación se realiza mediante credenciales de dominio y los permisos dependen de los grupos de seguridad asignados a cada usuario.


## Resultado

La implantación de Active Directory permitió:

- Administración centralizada de usuarios y equipos.
- Aplicación uniforme de políticas de seguridad.
- Gestión simplificada de permisos.
- Integración con MDT y WDS para despliegues automatizados.
- Reducción del tiempo de mantenimiento de los equipos.