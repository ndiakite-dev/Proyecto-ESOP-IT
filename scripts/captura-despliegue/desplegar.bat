@echo off
wpeutil setkeyboardlayout ES

echo ===================================
echo   Despliegue automatico ESOP
echo ===================================

echo.
echo Conectando al servidor...
net use Z: \\WIN-SERVER-ESOP\DeploymentShare$ /user:Administrador

echo.
echo Preparando el disco...
diskpart /s Z:\Scripts\prepare-disk.txt

echo.
echo Aplicando la imagen (esto tardara varios minutos)...
dism /apply-image /imagefile:"[RUTA CAPTURA DE IMAGEN .wim]" /index:1 /applydir:C:\

echo.
echo Configurando el arranque...
bcdboot C:\Windows /s S: /f UEFI

echo.
echo ===================================
echo   Despliegue completado. Reinicia el PC.
echo ===================================
pause
