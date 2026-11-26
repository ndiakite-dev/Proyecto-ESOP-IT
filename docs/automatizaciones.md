# Automatización con PowerShell

## Descripción
Para reducir tareas repetitivas y acelerar los despliegues se desarrollaron diversos scripts de automatización mediante PowerShell.

## Unión automática al dominio
Se creó un script específico para automatizar la incorporación de nuevos equipos al dominio.

### Funciones
- Configuración automática de DNS.
- Unión al dominio.
- Reinicio automático del sistema.

### Flujo
```text
Configurar DNS
        │
        ▼
Unir al dominio
        │
        ▼
Reinicio automático
```

## Beneficios

- Menor tiempo de configuración.
- Reducción de errores manuales.
- Despliegues más rápidos.
- Configuración consistente.

## Consideraciones de seguridad
Las versiones públicas de los scripts han sido modificadas para eliminar:

- Direcciones IP.
- Credenciales.
- Información sensible de infraestructura.