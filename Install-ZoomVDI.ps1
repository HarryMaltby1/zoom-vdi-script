# Download Zoom VDI Installer
Invoke-WebRequest -Uri "https://zoom.us/download/vdi/6.4.11.26350/ZoomInstallerVDI.msi?archType=x64" -OutFile "ZoomInstallerVDI.msi"

# Download Zoom Universal Plugin
Invoke-WebRequest -Uri "https://zoom.us/download/vdi/6.4.11.26350/ZoomVDIUniversalPluginx64.msi?archType=x64" -OutFile "ZoomAllInOnePlugin.msi"

# Install Universal Plugin
Start-Process -FilePath "msiexec.exe" -ArgumentList @("/i", "ZoomAllInOnePlugin.msi", "INSTALLFORAVD=1", "/qn", "/log", "C:\Temp\ZoomPluginInstall.log") 

# Install Zoom VDI with config
Start-Process msiexec.exe -ArgumentList '/i "ZoomInstallerVDI.msi" /qn ZConfig="kCmdParam_InstallOption=8;zSSOHost=plymouth.zoom.us"' 

