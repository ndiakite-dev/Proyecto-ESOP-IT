# Proyecto: Dominio ESOP

## Índice

1. Hardware
2. Instalación
3. Configuración de red
4. Active Directory Domain Services (AD DS)
5. Estructura de Active Directory
   - 5.1 Unidades Organizativas (OU)
   - 5.2 Grupos de seguridad
   - 5.3 Usuarios
6. Directivas de Grupo (GPOs)
   - 6.1 Default Domain Policy
   - 6.2 GPO_Alumnes
   - 6.3 GPO_Prof
7. Carpetas compartidas en el servidor. Carpeta Public en cada PC
8. Unión de PCs al dominio
9. Tareas pendientes

---

## 1. Hardware

El servidor de dominio se instaló en el rack del centro:

- **Ubicación:** Rack del aula de servidores
- **IP fija asignada:** [IP del servidor]
- **Sistema operativo:** Windows Server 2022
- **Nombre del servidor:** [NOMBRE-SERVIDOR]

---

## 2. Instalación

La ISO se descargó desde la página de Microsoft y la instalación se realizó desde Windows ejecutando `setup.exe`.

Para activarlo se usó el servicio KMS del organismo correspondiente mediante los comandos habituales en `cmd`.

---

## 3. Configuración de red (servidor)

- **IP fija:** [IP del servidor]
- **Máscara:** [Máscara de red]
- **Puerta de enlace:** [Puerta de enlace]

---

## 4. Active Directory Domain Services (AD DS)

Rol AD DS instalado desde Server Manager. Se promocionó el servidor a Domain Controller creando un nuevo bosque:

- **Nombre del dominio:** [DOMINIO]
- **Nivel funcional del bosque:** Windows Server 2016
- **DNS integrado con AD DS** instalado automáticamente

---

## 5. Estructura de Active Directory

### 5.1 Unidades Organizativas (OU)

- OU Alumnes (alumnos del centro)
- OU Professors (profesores del centro)
- OU Admins (usuarios administradores)

### 5.2 Grupos de seguridad

- Alumnes (tipo Seguridad, ámbito Global)
- Professors (tipo Seguridad, ámbito Global)
- Admins (tipo Seguridad, ámbito Global)

### 5.3 Usuarios

- **Administradores:** [usuarios administradores]
- **Alumnos:** Se crearon al inicio de curso con formato inicialApellido (ej: igarcía)

La contraseña inicial para todos los usuarios es [CONTRASEÑA INICIAL] (el usuario debe cambiarla en el primer inicio de sesión).

---

## 6. Directivas de Grupo (GPOs)

### 6.1 Default Domain Policy

Se aplica a todos los usuarios del dominio (Alumnes y Professors). Filtrado de seguridad: Usuarios autenticados (Lectura), Alumnes y Professors (Aplicar).

- Fondo de pantalla del centro forzado (imagen en SYSVOL)
- Imagen de pantalla de bloqueo del centro (por registro PersonalizationCSP)
- Plan de energía: máximo rendimiento, pantalla apaga a los 15 min
- Tarea programada: apagado automático a las 21h
- Firewall: reglas de entrada para RDP (TCP 3389) y detección de redes (perfil Dominio)
- Acceso RDP restringido (solo Administradores)
- Impedir que los usuarios modifiquen configuración de seguridad
- Filtro SmartScreen
- Impedir cambios de aspecto
- No permitir animaciones de ventanas
- Ocultar carpeta Active Directory
- Habilitar Active Desktop
- Vaciar archivos temporales de internet al cerrar explorador
- Telemetría desactivada
- Editor del registro (regedit) bloqueado

### 6.2 GPO_Alumnes

Vinculada a OU Alumnes.
Filtrado: grupo Alumnes.

- Panel de control restringido (solo Dispositivos y Aplicaciones)
- CMD bloqueado
- Instalación de programas bloqueada
- Opciones de energía bloqueadas
- Unidad Z: mapeada automáticamente a `\\[NOMBRE-SERVIDOR]\Compartit`
- Carpeta `C:\Public` creada y compartida en red a todos los PCs con permisos NTFS
- Script de inicio para configurar permisos SMB de carpeta Public (Todos: Cambiar)
- No mostrar centro de bienvenida

### 6.3 GPO_Prof

Vinculada a OU Profs. Sin restricciones adicionales. Incluye:

- Unidad P: mapeada automáticamente a `\\[NOMBRE-SERVIDOR]\Compartit\Professors`

---

## 7. Carpetas compartidas en el servidor

Ruta base: `C:\Compartit` (compartida como `\\[NOMBRE-SERVIDOR]\Compartit`)

### `\Professors`

Espacio donde cada profesor organiza y comparte su material con los alumnos: enunciados, presentaciones, apuntes, etc. Los alumnos solo pueden leer y descargar, no pueden modificar ni borrar nada.

- Profesores: control total
- Alumnos: lectura

### `\Recursos`

Carpeta con instaladores, drivers y manuales de uso general, migrada desde un PC del aula. Solo los administradores pueden añadir o modificar contenido. El resto de usuarios pueden acceder para consultar o descargar lo que necesiten.

- Todos: lectura
- Admins: control total
- Contiene instalables y manuales

### `\Entrega`

Carpeta de entrega de trabajos y actividades. Los alumnos pueden subir sus archivos, pero no pueden leer ni modificar archivos. Los profesores tienen acceso completo para revisar y corregir todo el contenido.

- Alumnos: escritura sin lectura de archivos
- Profesores: control total

### Carpeta Public en cada PC

Cada PC de alumno del dominio tiene `C:\Public` compartida como `\\nombrePC\Public`. Esta carpeta es para que los alumnos puedan compartir archivos entre ellos por la red.

- Usuarios autenticados: lectura, escritura, sin eliminar
- CREATOR OWNER: control total (cada usuario puede eliminar solo sus propios archivos)
- Administradores y SYSTEM: control total

---

## 8. Unión de PCs al dominio

Se creó un script PowerShell para automatizar el proceso en cada PC. Este hace:

- Configuración DNS (principal: [IP del servidor], secundario: [IP DNS secundario])
- Unión al dominio [DOMINIO] con credenciales de Administrador
- Reinicio automático a los 10 segundos
