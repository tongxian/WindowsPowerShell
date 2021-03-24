# !!! open this file with administrator rights
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
# Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

#Install Modules and import them
Install-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-PackageProvider -Name NuGet -Force
#Install-Module -Name PowerShellGet -Force
Install-Module -Name PowerShellGet -Force -Scope CurrentUser -AllowClobber
# Close Powershell and Restart a new powershell window after install PowerShellGet , reopen Powershell with administrator
# open Powershell with administrator
# start-process powershell -verb runas
invoke-expression 'cmd /c start powershell -Command { ./setup-stage2.ps1 }'
