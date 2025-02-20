@echo off
title Instalador Completo - Automatico - Dev Jessica

:: Inicio do processo de instalacao
echo =============================================
echo           Instalador Completo
echo =============================================

:: Etapa 1 - Abrir instalador do BDE 7
echo Abrindo instalador do BDE 7...
start "" "C:\GOURMET\01 Instaladores (basico)\BDE_7\bde.exe"
echo Instalador do BDE 7 aberto. Conclua a instalacao manualmente.
timeout /t 10 >nul

:: Criar atalho para o BDEADMIN apos a instalacao do BDE
echo Criando atalho para o BDEADMIN na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\BDEADMIN.lnk'); $sc.TargetPath = 'C:\Program Files (x86)\Borland\Common Files\BDE\BDEADMIN.exe'; $sc.Save()"
echo Atalho para o BDEADMIN criado com sucesso!

:: Copiar arquivo de configuracao do BDE
echo Copiando arquivo de configuracao do BDE...
xcopy "C:\GOURMET\01 Instaladores (basico)\IDAPI32.CFG" "C:\Program Files (x86)\Borland\Common Files\BDE" /Y
echo Arquivo copiado com sucesso!

:: Etapa 2 - Abrir instalador do Firebird 2.5
echo Abrindo instalador do Firebird 2.5...
start "" "C:\GOURMET\01 Instaladores (basico)\FIREBIRD 2.5\Firebird-2.5.2.26540_0_x64.exe"
echo Instalador do Firebird 2.5 aberto. Conclua a instalacao manualmente.
timeout /t 40 >nul

:: Copiar arquivos do Firebird apos instalacao
echo Copiando arquivos do Firebird para o disco C:...
xcopy "C:\Program Files\Firebird\Firebird_2_5\bin\fbclient.dll" "C:\" /Y
xcopy "C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" "C:\" /Y
xcopy "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" "C:\" /Y
xcopy "C:\GOURMET\security2.fdb" "C:\Program Files\Firebird\Firebird_2_5" /Y
xcopy "C:\GOURMET\CONFIGPRG.txt" "C:\" /Y
echo Arquivos do Firebird copiados com sucesso!

:: Configuracao de portas no firewall
echo Configurando portas no firewall...
netsh advfirewall firewall add rule name="Firebird 3050" dir=in action=allow protocol=TCP localport=3050
netsh advfirewall firewall add rule name="HTTP 80" dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name="HTTP Alt 8080" dir=in action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name="HTTP Alt 8081" dir=in action=allow protocol=TCP localport=8081
echo Portas configuradas com sucesso no firewall!

:: Etapa 3 - Criar atalho para o IBOConsole
echo Criando atalho para o IBOConsole na area de trabalho...
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\IBOConsole.lnk'); $sc.TargetPath = 'C:\GOURMET\01 Instaladores (basico)\IBOConsole\IBOConsole.exe'; $sc.Save()"
echo Atalho criado com sucesso!

:: Etapa 4 - Copiar arquivos CAPICOM
echo Copiando arquivos CAPICOM para as pastas do sistema...
xcopy "C:\GOURMET\01 Instaladores (basico)\CAPICOM\*.*" "C:\Windows\System\" /Y
xcopy "C:\GOURMET\01 Instaladores (basico)\CAPICOM\*.*" "C:\Windows\System32\" /Y
xcopy "C:\GOURMET\01 Instaladores (basico)\CAPICOM\*.*" "C:\Windows\SysWOW64\" /Y

:: Executar o instalador adicional
echo Executando instalador em C:\Windows\System\instala.bat...
start "" "C:\Windows\System\instala.bat"
echo Arquivos CAPICOM copiados com sucesso!

:: Etapa 5 - Criar atalhos para executaveis
echo Criando atalhos na area de trabalho...

:: Atalho para MOVIMENTO_NFCE
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\MOVIMENTO_NFCE.lnk'); $sc.TargetPath = 'C:\GOURMET\BIN\MOVIMENTO_NFCE.exe'; $sc.Save()"
echo Atalho para MOVIMENTO_NFCE criado com sucesso!

:: Atalho para Gourmet
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\Gourmet.lnk'); $sc.TargetPath = 'C:\GOURMET\BIN\Gourmet.exe'; $sc.Save()"
echo Atalho para Gourmet criado com sucesso!

:: Atalho para GI
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%USERPROFILE%\Desktop\GI.lnk'); $sc.TargetPath = 'C:\GOURMET\BIN\GI.exe'; $sc.Save()"
echo Atalho para GI criado com sucesso!

:: Fim do processo
echo =============================================
echo       Instalacao concluida com sucesso!
echo =============================================
timeout /t 10 >nul
exit
