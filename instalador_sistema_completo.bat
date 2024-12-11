@echo off
:: Exibir título do prompt
title Instalador Gourmet - Menu Interativo

:: Loop para voltar ao menu após cada operação
:MENU
cls
echo =============================================
echo          Instalador Gourmet - Menu
echo =============================================
echo [1] Abrir instalador do BDE 7
echo [2] Abrir instalador do Firebird 2.5
echo [3] Criar atalho para o IBOConsole
echo [4] Copiar arquivos CAPICOM para o sistema
echo [5] Criar atalho Executaveis
echo [0] Sair
echo =============================================
set /p opcao="Digite o numero da opcao desejada: "

:: Verificar a opção selecionada
if "%opcao%"=="1" goto ABRIR_BDE
if "%opcao%"=="2" goto ABRIR_FIREBIRD
if "%opcao%"=="3" goto CRIAR_ATALHO
if "%opcao%"=="4" goto COPIAR_CAPICOM
if "%opcao%"=="5" goto CRIAR_ATALHO_EXE
if "%opcao%"=="0" goto SAIR

:: Opção inválida
echo Opcao invalida. Tente novamente!
pause
goto MENU

:: Opção 1 - Abrir instalador do BDE 7
:ABRIR_BDE
echo Abrindo instalador do BDE 7...
start "" "C:\GOURMET\01 Instaladores (basico)\BDE_7\bde.exe"
echo Instalador do BDE 7 aberto. Conclua a instalacao manualmente.
pause

:: Criar atalho para o BDEADMIN após a instalação do BDE
echo Criando atalho para o BDEADMIN na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\BDEADMIN.lnk'); $sc.TargetPath = 'C:\Program Files (x86)\Borland\Common Files\BDE\BDEADMIN.exe'; $sc.Save()"
echo Atalho para o BDEADMIN criado com sucesso!
pause
goto MENU

:: Opção 2 - Abrir instalador do Firebird 2.5
:ABRIR_FIREBIRD
echo Abrindo instalador do Firebird 2.5...
start "" "C:\GOURMET\01 Instaladores (basico)\FIREBIRD 2.5\Firebird-2.5.2.26540_0_x64.exe"
echo Instalador do Firebird 2.5 aberto. Conclua a instalacao manualmente.
pause

:: Copiar arquivos do Firebird para o disco C: após instalação
echo Copiando arquivos do Firebird para o disco C:...
xcopy "C:\Program Files\Firebird\Firebird_2_5\bin\fbclient.dll" "C:\" /Y
xcopy "C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" "C:\" /Y
xcopy "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" "C:\" /Y
xcopy "C:\GOURMET\security2.fdb" "C:\Program Files\Firebird\Firebird_2_5" /Y
xcopy "C:\GOURMET\CONFIGPRG.txt" "C:\" /Y
echo Arquivos do Firebird copiados com sucesso!
pause
goto MENU

:: Opção 3 - Criar atalho para o IBOConsole
:CRIAR_ATALHO
echo Criando atalho para o IBOConsole na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\IBOConsole.lnk'); $sc.TargetPath = 'C:\GOURMET\01 Instaladores (basico)\IBOConsole\IBOConsole.exe'; $sc.Save()"
echo Atalho criado com sucesso!
pause
goto MENU

:: Opção 4 - Copiar arquivos CAPICOM
:COPIAR_CAPICOM
echo Copiando arquivos CAPICOM para as pastas do sistema...

:: Copiar para C:\Windows\System
xcopy "C:\GOURMET\01 Instaladores (basico)\CAPICOM\*.*" "C:\Windows\System\" /Y

:: Copiar para C:\Windows\System32
xcopy "C:\GOURMET\01 Instaladores (basico)\CAPICOM\*.*" "C:\Windows\System32\" /Y

:: Copiar para C:\Windows\SysWOW64
xcopy "C:\GOURMET\01 Instaladores (basico)\CAPICOM\*.*" "C:\Windows\SysWOW64\" /Y

echo Arquivos CAPICOM copiados com sucesso!

:: Executar o instalador adicional em C:\Windows\System após a cópia
echo Executando instalador em C:\Windows\System\instala.bat...
start "" "C:\Windows\System\instala.bat"
pause
goto MENU

:: Opção 5 - Criar atalho para Executaveis
:CRIAR_ATALHO_EXE
echo Criando atalho para o MOVIMENTO_NFCE na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\MOVIMENTO_NFCE.lnk'); $sc.TargetPath = 'C:\GOURMET\BIN\MOVIMENTO_NFCE.exe'; $sc.Save()"
echo Atalho criado com sucesso!

echo Criando atalho para o Gourmet na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\Gourmet.lnk'); $sc.TargetPath = 'C:\GOURMET\BIN\Gourmet.exe'; $sc.Save()"
echo Atalho criado com sucesso!

echo Criando atalho para o GI na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\GI.lnk'); $sc.TargetPath = 'C:\GOURMET\BIN\GI.exe'; $sc.Save()"
echo Atalho criado com sucesso!

pause
goto MENU

:: Sair do script
:SAIR
echo Saindo do instalador. Ate logo!
pause
exit