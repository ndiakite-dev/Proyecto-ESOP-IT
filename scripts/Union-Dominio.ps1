# =====================================================
# Script para unir un PC al dominio esop.local
# =====================================================

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "ERROR: El script se debe ejecutar como Administrador." -ForegroundColor Red
    Pause
    Exit
}

# CONFIGURACION
$dominio    = "esop.local"
$usuari     = "esop\Administrador"
$contrasenya = "****"
$dnsPrincipal  = "[ip]"
$dnsSecundari  = "[ip]"

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Union automatica al dominio: $dominio" -ForegroundColor Cyan
Write-Host " PC actual: $env:COMPUTERNAME" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Configuracion DNS
Write-Host "[1/3] Configurando DNS..." -ForegroundColor Yellow

$adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1

if ($adapter) {
    Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $dnsPrincipal, $dnsSecundari
    Write-Host "      DNS principal:  $dnsPrincipal" -ForegroundColor Green
    Write-Host "      DNS secundario:  $dnsSecundari" -ForegroundColor Green
} else {
    Write-Host "      ERROR: No se ha encontrado ningun adaptador de red activo" -ForegroundColor Red
    Pause
    Exit
}

Write-Host ""

# Union a dominio
Write-Host "[2/3] Uniendo el equipo al dominio $dominio ..." -ForegroundColor Yellow

$credencials = New-Object System.Management.Automation.PSCredential($usuari, (ConvertTo-SecureString $contrasenya -AsPlainText -Force))

try {
    Add-Computer -DomainName $dominio -Credential $credencials -Force -ErrorAction Stop
    Write-Host "      El equipo se unio correctamente al dominio." -ForegroundColor Green
}
catch {
    Write-Host ""
    Write-Host "=====================================================" -ForegroundColor Red
    Write-Host " ERROR: No se a podido unir el equipo al dominio." -ForegroundColor Red
    Write-Host " $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "=====================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Posibles causas:" -ForegroundColor Yellow
    Write-Host " - No hay conexion con el servidor (pruebe: ping $dnsPrincipal)" -ForegroundColor Yellow
    Write-Host " - Credenciales incorrectas" -ForegroundColor Yellow
    Write-Host " - El nombre de este equipo ya existe en el dominio" -ForegroundColor Yellow
    Pause
    Exit
}

Write-Host ""

# Reiniciar equipo
Write-Host "[3/3] El equipo sera reiniciado en 10 segons..." -ForegroundColor Yellow
Write-Host "      Ctrl+C para cancelar el reinicio." -ForegroundColor Gray
Start-Sleep -Seconds 10
Restart-Computer -Force
