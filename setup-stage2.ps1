# if use previous code to setup powershell install, skip this
if (0) {
    # Set ExecutionPolicy to enable install modules 
    # TODO need administrator rights
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

    # install neccissary package provider
    # Install-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted3
    Install-PackageProvider -Name NuGet -Force
}
if (0)
{ # test several times, it doesn't work
    # git clone the configurated repository
    Set-Location $env:USERPROFILE\Documents\
    $psModulePath = Get-ChildItem -Name
    if (!($psModulePath -contains "WindowsPowerShell")) {
        git clone https://github.com/tongxian/WindowsPowerShell.git
    }
}
# $checkModule = "posh-git"

# check the installed modules , install the uninstalled 
$Installedmodules = Get-InstalledModule
function CheckAndInstallModules ($checkModule) {
    if ($Installedmodules.name -contains $checkModule) {
        "$checkModule is installed "
    }
    else {
        "$checkModule is not installed, installing"
        if ($checkModule -contains "PoShFuck") {
            Invoke-Expression ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/mattparkes/PoShFuck/master/Install-TheFucker.ps1'))
        }
        elseif ($checkModule -contains "PowerShellGet") {
            Install-Module -Name PowerShellGet -Force -Scope CurrentUser -AllowClobber
            Write-Output "Close Powershell and Restart a new powershell window"
            invoke-expression 'cmd /c start powershell -Command { ./setup-stage2.ps1; Read-Host }'
        }
        elseif ($checkModule -contains "PSReadLine") {
            Install-Module PSReadLine -AllowPrerelease -Force  -Scope CurrentUser
            Write-Output "Close Powershell and Restart a new powershell window"
            invoke-expression 'cmd /c start powershell -Command { ./setup-stage2.ps1; Read-Host }'
        }
        else {
            Install-Module -Name $checkModule  -Scope CurrentUser
        }
        # Import-Module $checkModule
    }
}
$Modules = @(
    'PowerShellGet'
    'PSReadLine'
    'posh-git'
    'oh-my-posh'
    'Get-ChildItemColor'
    'PSFzf'
    'ZLocation'
    'PSEverything'
    'git-aliases'
    'Fasdr'
    'PoShFuck'
)

foreach ($item in $Modules) {
    CheckAndInstallModules ($item)
}

# install fonts to beautify powershell
$current = Get-Location
Set-Location $env:USERPROFILE\Downloads\
git clone https://github.com/powerline/fonts.git

.\fonts\install.ps1

