# Group Policy Objects (GPO)

## Resumen

Las Directivas de Grupo (GPO) se utilizaron para centralizar la configuración, seguridad y administración de todos los equipos del dominio.

Esto permitió mantener configuraciones homogéneas y reducir tareas manuales de mantenimiento.


## Objetivos

- Aplicar configuraciones de forma centralizada.
- Restringir funciones en los equipos del alumnado.
- Automatizar configuraciones de red.
- Mejorar la seguridad de los equipos.
- Estandarizar la experiencia de usuario.


## Estructura de GPOs

### Default Domain Policy

Configuraciones globales aplicadas a todos los usuarios:

- Fondo corporativo del centro.
- Pantalla de bloqueo personalizada.
- Configuración energética.
- Apagado automático de equipos.
- Configuración básica del firewall.
- Restricciones de seguridad.
- Desactivación de herramientas administrativas.


### GPO_Alumnes

Configuraciones específicas para alumnado:

- Bloqueo de CMD.
- Bloqueo del Panel de Control.
- Restricción de instalación de software.
- Restricción de opciones de energía.
- Ocultación de configuraciones avanzadas.
- Mapeo automático de unidades de red.


### GPO_Prof

Configuraciones específicas para profesorado:

- Acceso a unidades compartidas.
- Configuración corporativa común.
- Sin restricciones adicionales.


## Resultados

- Asignación automática de unidades de red según el perfil del usuario.
- Creación de recursos compartidos en los equipos del alumnado.
- Configuración automática de permisos SMB.
- Aplicación centralizada de restricciones de seguridad.
## Beneficios

- Gestión centralizada.
- Mayor seguridad.
- Menor intervención manual.
- Reducción de incidencias provocadas por modificaciones de usuarios.