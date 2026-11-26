# Active Directory

## Descripción
Para centralizar la gestión de usuarios, equipos y permisos del centro se implementó una infraestructura basada en Active Directory Domain Services (AD DS) sobre Windows Server 2022.

El servidor actúa como Controlador de Dominio y proporciona servicios de autenticación, resolución DNS y aplicación de políticas de grupo.

## Configuración del dominio
- Sistema operativo: Windows Server 2022
- Rol instalado: Active Directory Domain Services (AD DS)
- DNS integrado con Active Directory
- Nivel funcional del bosque: Windows Server 2016
- Tipo de implementación: Nuevo bosque

## Estructura organizativa

Se diseñó una estructura sencilla basada en roles para facilitar la administración y la aplicación de GPO.

```text
DOMINIO
│
├── OU_Alumnes
├── OU_Professors
└── OU_Admins
```

### OU_Alumnes
Contiene todas las cuentas de alumnado.

### OU_Professors
Contiene todas las cuentas de profesorado.

### OU_Admins
Contiene las cuentas con privilegios administrativos.

## Grupos de seguridad
Los permisos se asignan mediante grupos de Active Directory para simplificar la administración.

### Alumnes
Grupo utilizado para:

- Aplicación de GPO del alumnado
- Acceso a carpetas compartidas
- Asignación de recursos de red

### Professors
Grupo utilizado para:

- Aplicación de GPO de profesorado
- Acceso a recursos docentes

### Admins
Grupo utilizado para:

- Administración del dominio
- Gestión de servidores
- Gestión de recursos compartidos

## Gestión de usuarios
Los usuarios se organizan según su función dentro del centro.

### Alumnado
- Cuenta individual por alumno.
- Cambio obligatorio de contraseña en el primer inicio de sesión.

### Profesorado
- Acceso a recursos de docencia.
- Acceso a unidades compartidas específicas.

### Administradores
- Acceso completo a la infraestructura.

## Integración con otros servicios
Active Directory se integra con:

- DNS
- GPO
- MDT
- WDS
- Recursos compartidos SMB

permitiendo una administración centralizada de toda la infraestructura.

## Resultado
La implantación del dominio permitió:

- Centralizar usuarios y equipos.
- Gestionar permisos desde un único punto.
- Simplificar el mantenimiento.
- Facilitar el despliegue automatizado de nuevos equipos.