# how to beauty powershell 
> we have to update PSReadLine to prerelease version to autocompletion settings

[TOC]

## Step 0: Install scoop 

install scoop first to get the fzf, so that import-module PSFzf will work

- **管理员权限start powershell** 
  	  输入以下脚本保证允许本地脚本的执行

  ​	  set-executionpolicy remotesigned -scope currentuser 

- **安装scoop**

```sh
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```
- **install apps**
   `scoop install fd fzf typora snipaste quicklook ripgrep everything ditto`

## Method 1 - using setup.ps1

[setup.ps1](./setup.ps1)

## Method 2 - Install Powershell Module step by step

**Current user to Install module**

### Step 1: Get the latest version from PowerShell Gallery

Before updating PowerShellGet, you should always install the latest NuGet provider. [From an elevated PowerShell session, run the following command](https://docs.microsoft.com/en-us/powershell/scripting/gallery/installing-psget?view=powershell-7).
~~~ powershell
Install-PackageProvider -Name NuGet -Force
~~~
### Step 2: Get the latest PowerShellGet to install PSReadLine
~~~ powershell
Install-Module -Name PowerShellGet -Force -Scope CurrentUser -AllowClobber
~~~
Close Powershell and Restart a new powershell window

### Step 3: get the latest prerelease version of PSReadLine. 
~~~ powershell
Install-Module PSReadLine -AllowPrerelease -Force
~~~
### Step 4:  Get-ChildItemColor to set terminal color
~~~ powershell
Install-Module -Name  Get-ChildItemColor -Force -Scope CurrentUser -AllowClobber
~~~
### Step 5: install git packages
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
