echo Find the path to MSBuild 4.0 on this machine
for /f "tokens=2*" %%A in ('REG QUERY "HKLM\SOFTWARE\Microsoft\MSBuild\ToolsVersions\4.0" /v MSBuildToolsPath') DO (
  for %%F in (%%B) do (
    set MSBuildToolsPath=%%F
    goto :break
  )
)
:break

echo Change the path to where the bat file is                  
set "curpath=%~dp0" 
cd /d %curpath% 

C:\Windows\System32\cmd.exe /c "%MSBuildToolsPath%msbuild.exe "SimpleDotNetProject/SimpleDotNetProject.csproj" /nologo /m /t:Build /p:config=Release /p:OverwriteReadOnlyFiles=TRUE