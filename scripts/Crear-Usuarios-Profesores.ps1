# =============================================================================================
# Este script esta dedicado para la creacion masiva de usuarios PROFESSORS - esop.local
# =============================================================================================

Import-Module ActiveDirectory

$OU = "OU=Professors,DC=esop,DC=local"
$Grupo = "Professors"
$PasswordInicial = "*****"
$Dominio = "esop.local"

$SecurePassword = ConvertTo-SecureString $PasswordInicial -AsPlainText -Force

# Nombre, Apellido, NombreDeUsuario (inicial + primer apellido)
$Profesores = @(
    @{Nombre="Prof1";            Apellidos="Apellido1";           User="papellido1"}
    @{Nombre="Prof2";            Apellidos="Apellido2";           User="papellido2"}
    @{Nombre="Prof3";            Apellidos="Apellido3";           User="papellido3"}
#etc...
)

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Creando $($Profesores.Count) usuarios de profesores en $OU" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

$ok = 0
$errores = 0

foreach ($p in $Profesores) {
    $nombreCompleto = "$($p.Nombre) $($p.Apellidos)"
    $upn = "$($p.User)@$Dominio"

    try {
        $existe = Get-ADUser -Filter "SamAccountName -eq '$($p.User)'" -ErrorAction SilentlyContinue
        if ($existe) {
            Write-Host "  [USUARIO EXISTENTE] $($p.User) ($nombreCompleto) - omitido" -ForegroundColor Yellow
            continue
        }

        New-ADUser `
            -Name $nombreCompleto `
            -GivenName $p.Nombre `
            -Surname $p.Apellidos `
            -SamAccountName $p.User `
            -UserPrincipalName $upn `
            -Path $OU `
            -AccountPassword $SecurePassword `
            -ChangePasswordAtLogon $true `
            -Enabled $true `
            -ErrorAction Stop

        Add-ADGroupMember -Identity $Grupo -Members $p.User -ErrorAction Stop

        Write-Host "  [OK] $($p.User)  -  $nombreCompleto" -ForegroundColor Green
        $ok++
    }
    catch {
        Write-Host "  [ERROR] $($p.User) ($nombreCompleto): $($_.Exception.Message)" -ForegroundColor Red
        $errores++
    }
}

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Fin. Usuarios creados correctamente: $ok   Errores: $errores" -ForegroundColor Cyan
Write-Host " Contrasena inicial para todos: $PasswordInicial" -ForegroundColor Cyan
Write-Host " (Se pedira cambiarla en el primer inicio de sesion)" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
