# how to beauty powershell 
> we have to update PSReadLine to prerelease version to autocompletion settings

- [how to beauty powershell](#how-to-beauty-powershell)
  - [Step 1: Get the latest version from PowerShell Gallery](#step-1-get-the-latest-version-from-powershell-gallery)
  - [Step 2: Get the latest PowerShellGet to install PSReadLine](#step-2-get-the-latest-powershellget-to-install-psreadline)
  - [Step 3: get the latest prerelease version of PSReadLine.](#step-3-get-the-latest-prerelease-version-ofpsreadline)
  - [Step 4:  Get-ChildItemColor to set terminal color](#step-4-get-childitemcolor-to-set-terminal-color)
  - [Step 5: install git packages](#step-5-install-git-packages)

**Current user to Install module**

## Step 1: Get the latest version from PowerShell Gallery

Before updating PowerShellGet, you should always install the latest NuGet provider. From an elevated PowerShell session, run the following command.
~~~ powershell
Install-PackageProvider -Name NuGet -Force
https://docs.microsoft.com/en-us/powershell/scripting/gallery/installing-psget?view=powershell-7
~~~
## Step 2: Get the latest PowerShellGet to install PSReadLine
~~~ powershell
Install-Module -Name PowerShellGet -Force -Scope CurrentUser -AllowClobber
~~~
Close Powershell and Restart a new powershell window

## Step 3: get the latest prerelease version of PSReadLine. 
~~~ powershell
Install-Module PSReadLine -AllowPrerelease -Force
~~~
## Step 4:  Get-ChildItemColor to set terminal color
~~~ powershell
Install-Module -Name  Get-ChildItemColor -Force -Scope CurrentUser -AllowClobber
~~~
## Step 5: install git packages
~~~ powershell
• Install-Module posh-git  -Scope CurrentUser
• Install-Module oh-my-posh -Scope CurrentUser
• Install-Module -Name PSFzf -AllowPrerelease -Scope CurrentUser
	- PSfzf needs
	- Install-Module ZLocation -Scope CurrentUser
	- Install-Module -Name PSEverything
	
• Install-Module -Name Get-ChildItemColor -Scope CurrentUser 
• Poshfuck
	- Set-ExecutionPolicy RemoteSigned
	- iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/mattparkes/PoShFuck/master/Install-TheFucker.ps1'))
• Install-Module -Name Fasdr
~~~	
