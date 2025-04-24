# winget --info
# winget source reset --force
# winget source update winget --verbose
# $smpath = "$env:TEMP\source.msix"
# Invoke-WebRequest -Uri https://cdn.winget.microsoft.com/cache/source.msix -OutFile $smpath
# Add-AppxPackage -Path $smpath 
winget install PuTTY.PuTTY --accept-source-agreements --accept-package-agreements