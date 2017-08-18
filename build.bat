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

C:\Windows\System32\cmd.exe /c "%MSBuildToolsPath%msbuild.exe "SimpleDotNetProject/SimpleDotNetProject.csproj" /nologo /m /t:Build /p:config=Release /p:OverwriteReadOnlyFiles=TRUE /p:DCC_UnitSearchPath="C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\lib\win32\release;C:\LMD2013\lib\d17\Win32;C:\Program Files (x86)\LMD2013\lib\d17\Win32;C:\program files (x86)\embarcadero\rad studio\10.0\Imports;C:\Users\Public\Documents\RAD Studio\10.0\Dcp;C:\program files (x86)\embarcadero\rad studio\10.0\include;C:\Program Files (x86)\DevExpress VCL\Library\RS17;C:\Program Files (x86)\DevExpress VCL XE3\Library\RS17;C:\Users\Public\Documents\RAD Studio\10.0\Bpl;%LanguardCommonUnitsPath%;%LanguardCommonUnitsPathDeep%;C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\source\DUnit\src;C:\Program Files (x86)\EldoS\SecureBlackbox\Units\Delphi17\Win32;C:\Program Files (x86)\EldoS\SecureBlackbox.VCL\Units\Delphi17\Win32;Win32\Release" "