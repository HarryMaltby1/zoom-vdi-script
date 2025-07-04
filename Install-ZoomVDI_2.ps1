$ErrorActionPreference = 'Stop'

# Ensure temp directory exists
if (-not (Test-Path 'C:\temp')) {
    New-Item -ItemType Directory -Path 'C:\temp' | Out-Null
}

# --- Zoom Universal Plugin Installer ---
Invoke-WebRequest -Uri 'https://zoom.us/download/vdi/6.4.11.26350/ZoomVDIUniversalPluginx64.msi?archType=x64' -OutFile 'C:\temp\ZoomUniversalPlugin.zip'
Expand-Archive 'C:\temp\ZoomUniversalPlugin.zip' 'C:\temp' -Force

Copy-Item 'C:\temp\ZoomAllInOnePlugin.msi' -Destination 'C:\temp' -Force

Start-Process -FilePath msiexec.exe -ArgumentList '/i', 'C:\temp\ZoomAllInOnePlugin.msi', 'INSTALLFORAVD=1', '/qn' -Wait -PassThru

# --- Zoom VDI Installer ---
Invoke-WebRequest -Uri 'https://zoom.us/download/vdi/6.4.11.26350/ZoomInstallerVDI.msi?archType=x64' -OutFile 'C:\temp\ZoomInstallerVDI.zip'
Expand-Archive 'C:\temp\ZoomInstallerVDI.zip' 'C:\temp' -Force

Copy-Item 'C:\temp\ZoomInstallerVDI.msi' -Destination 'C:\temp' -Force

Start-Process -FilePath msiexec.exe -ArgumentList '/i', 'C:\temp\ZoomInstallerVDI.msi', '/qn', '/ZConfig="kCmdParam_InstallOption=8;zSSOHost=plymouth.zoom.us"' -Wait -PassThru
