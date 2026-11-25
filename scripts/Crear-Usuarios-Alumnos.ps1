# =============================================================================================
# Este script esta dedicado para la creacion masiva de usuarios ALUMNOS - esop.local
# =============================================================================================

Import-Module ActiveDirectory

$OU = "OU=Alumnes,DC=esop,DC=local"
$Grupo = "Alumnes"
$PasswordInicial = "******"
$Dominio = "esop.local"

$SecurePassword = ConvertTo-SecureString $PasswordInicial -AsPlainText -Force

# Nombre, Apellidos, NombreDeUsuario (inicial + primer apellido)
$Alumnos = @(
    @{Nombre="Alumno1";            Apellidos="Apellido1";           User="aapellido1"}
    @{Nombre="Alumno2";            Apellidos="Apellido2";           User="aapellido2"}
    @{Nombre="Alumno3";            Apellidos="Apellido3";           User="aapellido3"}
#etc...
)

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Creando $($Alumnos.Count) usuarios de alumnos en $OU" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

$ok = 0
$errores = 0

foreach ($a in $Alumnos) {
    $nombreCompleto = "$($a.Nombre) $($a.Apellidos)"
    $upn = "$($a.User)@$Dominio"

    try {
        # Se comprueba si el usuario ya existe
        $existe = Get-ADUser -Filter "SamAccountName -eq '$($a.User)'" -ErrorAction SilentlyContinue
        if ($existe) {
            Write-Host "  [USUARIO EXISTENTE] $($a.User) ($nombreCompleto) - omitido" -ForegroundColor Yellow
            continue
        }

        New-ADUser `
            -Name $nombreCompleto `
            -GivenName $a.Nombre `
            -Surname $a.Apellidos `
            -SamAccountName $a.User `
            -UserPrincipalName $upn `
            -Path $OU `
            -AccountPassword $SecurePassword `
            -ChangePasswordAtLogon $true `
            -Enabled $true `
            -ErrorAction Stop

        Add-ADGroupMember -Identity $Grupo -Members $a.User -ErrorAction Stop

        Write-Host "  [OK] $($a.User)  -  $nombreCompleto" -ForegroundColor Green
        $ok++
    }
    catch {
        Write-Host "  [ERROR] $($a.User) ($nombreCompleto): $($_.Exception.Message)" -ForegroundColor Red
        $errores++
    }
}

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " Fin. Usuarios creados correctamente: $ok   Errores: $errores" -ForegroundColor Cyan
Write-Host " Contrasena inicial para todos: $PasswordInicial" -ForegroundColor Cyan
Write-Host " (Se pedira cambiarla en el primer inicio de sesion)" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
