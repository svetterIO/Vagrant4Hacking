$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

# broken source> https://github.com/microsoft/winget-cli/issues/3001
$smpath = "$env:TEMP\source.msix"
Invoke-WebRequest -Uri https://cdn.winget.microsoft.com/cache/source.msix -OutFile $smpath
Add-AppxPackage -Path $smpath 

# https://github.com/microsoft/winget-cli/issues/3894
# 0x8a15000f : Data required by the source is missing

# Invoke-WebRequest -Uri https://www.microsoft.com/p/app-installer/9nblggh4nns1 -OutFile AppInstaller.appx
# Add-AppxPackage AppInstaller.appx

# https://github.com/microsoft/winget-cli/issues/1348
# Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.Winget.Source_8wekyb3d8bbwe


# winget remove source msstore> Error: 0x8a15000f : Data required by the source is missing
# winget source reset --force > Error: 0x8a15000f : Data required by the source is missing
# winget source update        > Error: Cancelled