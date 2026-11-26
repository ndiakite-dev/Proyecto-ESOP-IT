# Carpetas compartidas

## Descripción

Se diseñó una estructura de almacenamiento centralizada para organizar documentación, materiales docentes y entregas de alumnado.

El acceso se controla mediante permisos NTFS y grupos de Active Directory.

## Estructura

```text
Compartit
│
├── Professors
├── Recursos
└── Entregas
```

## Professors

Repositorio de trabajo del profesorado.

Se utiliza para almacenar:

- Apuntes
- Presentaciones
- Ejercicios
- Material de aula
### Permisos

|Grupo|Permiso|
|---|---|
|Professors|Control total|
|Alumnes|Lectura|

Los alumnos pueden consultar y descargar contenido, pero no modificarlo.
## Recursos

Repositorio común para software y documentación técnica.

Contiene:

- Instaladores
- Drivers
- Manuales
- Utilidades técnicas

Parte del contenido fue migrado desde equipos existentes del centro.

### Permisos

|Grupo|Permiso|
|---|---|
|Admins|Control total|
|Usuarios|Lectura|

## Entregas

Espacio destinado a la entrega de actividades y trabajos.

### Permisos

|Grupo|Permiso|
|---|---|
|Alumnes|Escritura|
|Professors|Control total|

El alumnado puede subir contenido sin acceder a los archivos de otros usuarios.

## Carpetas públicas de aula

Además de los recursos centralizados del servidor, cada equipo del alumnado dispone de una carpeta local compartida.

```text
C:\Public
```

Compartida en red como:

```text
\\nombrePC\Public
```

Su objetivo es facilitar el intercambio de archivos entre equipos dentro de la red local.

### Permisos

| Grupo                 | Permiso                              |
| --------------------- | ------------------------------------ |
| Usuarios autenticados | Lectura y escritura                  |
| CREATOR OWNER         | Control total sobre archivos propios |
| Administradores       | Control total                        |
| SYSTEM                | Control total                        |

## Mapeo automático de unidades

La asignación de recursos se realiza automáticamente mediante GPO.
### Alumnado

```text
Z:
```

Unidad compartida general del centro.
### Profesorado

```text
P:
```

Acceso directo al repositorio de material docente.

## Resultado

- Gestión centralizada de recursos.
- Permisos diferenciados por perfil.
- Compartición segura de archivos.
- Entorno homogéneo para alumnado y profesorado.