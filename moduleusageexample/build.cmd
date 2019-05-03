@ECHO OFF
IF NOT EXIST "tools" (md "tools")
IF NOT EXIST "tools\nuget.exe" (@powershell -NoProfile -ExecutionPolicy Bypass -Command "(New-Object System.Net.WebClient).DownloadFile('https://dist.nuget.org/win-x86-commandline/latest/nuget.exe','tools/nuget.exe')")
IF NOT EXIST "tools\Cake" (tools\nuget.exe install Cake -ExcludeVersion -OutputDirectory "Tools" -Source https://www.nuget.org/api/v2/)
(tools\Cake\Cake.exe build.cake --bootstrap) && (tools\Cake\Cake.exe build.cake)