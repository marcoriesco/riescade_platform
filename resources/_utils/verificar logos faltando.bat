@echo off
setlocal enabledelayedexpansion

:: Caminho relativo da pasta com as subpastas (roms)
set "diretorio_pastas=..\..\..\..\..\..\roms\teknoparrot"

:: Caminho relativo da pasta com as imagens (clean)
set "diretorio_imagens=..\logos\platform"

echo Verificando pastas que nao possuem imagens correspondentes...
echo.

:: Verifica se os diretórios existem
if not exist "%diretorio_pastas%" (
    echo ERRO: O diretorio "%diretorio_pastas%" nao foi encontrado.
    pause
    exit /b
)
if not exist "%diretorio_imagens%" (
    echo ERRO: O diretorio "%diretorio_imagens%" nao foi encontrado.
    pause
    exit /b
)

:: Percorre todas as subpastas no diretório "roms" (apenas 1 nível)
for /d %%p in ("%diretorio_pastas%\*") do (
    set "pasta=%%~nxp"
    
    :: Remove o "_" do início do nome da pasta (se houver)
    if "!pasta!" neq "!pasta:~0,1!" (
        set "pasta=!pasta:~1!"
    )
    
    set "imagem=%diretorio_imagens%\!pasta!.png"
    
    :: Verifica se a imagem correspondente existe
    if not exist "!imagem!" (
        echo A pasta "%%~nxp" nao possui uma imagem correspondente.
    )
)

echo.
echo Verificacao concluida.
pause
