# Carpetas compartidas y gestión de permisos

## Resumen

Se diseñó una estructura de recursos compartidos para facilitar la colaboración entre profesorado y alumnado.

Todas las carpetas utilizan permisos NTFS y SMB basados en grupos de Active Directory.


## Objetivos

- Compartir recursos de forma segura.
- Segregar permisos según perfiles.
- Facilitar la entrega de trabajos.
- Centralizar documentación y recursos.


## Estructura

```text
Compartido
│
├── Professors
├── Recursos
└── Entrega
```


## Professors

Repositorio para material docente.

### Permisos

Profesores:

- Lectura
- Escritura

Alumnos:

- Lectura

## Recursos

Almacenamiento de:

- Instaladores
- Drivers
- Manuales
- Documentación técnica

### Permisos

Administradores:

- Control total

Usuarios:

- Lectura


## Entrega

Espacio destinado a la entrega de trabajos.

### Permisos

Alumnos:

- Escritura

Profesores:

- Control total


## Unidades de red

Las unidades fueron mapeadas automáticamente mediante GPO.

### Alumnado

- Unidad Z:

### Profesorado

- Unidad P:


## Beneficios

- Gestión centralizada de recursos.
- Mayor organización.
- Control de acceso por rol.
- Entorno colaborativo simplificado.