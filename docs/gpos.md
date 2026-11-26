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
Configuración común aplicada a todos los usuarios del dominio.

#### Configuración visual
- Fondo corporativo del centro.
- Pantalla de bloqueo personalizada.

#### Configuración energética
- Plan de alto rendimiento.
- Apagado de pantalla tras período de inactividad.
- Apagado automático de equipos mediante tarea programada.

#### Seguridad
- Restricción de acceso remoto mediante RDP.
- Configuración de firewall.
- SmartScreen habilitado.
- Editor del registro bloqueado.
- Restricción de cambios en la configuración de seguridad.
#### Configuración del sistema
- Desactivación de telemetría.
- Configuración homogénea del entorno de usuario.

### GPO_Alumnes
Directiva aplicada a la OU de alumnado.

#### Restricciones de usuario
- Acceso limitado al Panel de Control (solo dispositivos y aplicaciones).
- Bloqueo del símbolo del sistema (CMD).
- Restricción de instalación de software.
- Bloqueo de opciones de energía.
- Ocultación del centro de bienvenida.

#### Recursos de red
- Mapeo automático de la unidad Z:.
- Creación automática de la carpeta local `C:\Public`.
- Compartición automática de `C:\Public` mediante SMB.
- Script de inicio para configuración de permisos compartidos.

### GPO_Prof
Directiva aplicada al profesorado.
#### Recursos de red
- Mapeo automático de la unidad P: destinada al material docente compartido.

## Automatizaciones implementadas mediante GPO
- Asignación automática de unidades de red según el perfil del usuario.
- Creación de recursos compartidos en los equipos del alumnado.
- Configuración automática de permisos SMB.
- Aplicación centralizada de restricciones de seguridad.
## Beneficios
- Gestión centralizada.
- Mayor seguridad.
- Menor intervención manual.
- Reducción de incidencias provocadas por modificaciones de usuarios.