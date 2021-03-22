Import-Module Get-ChildItemColor
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
function GitLogPretty {
  git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
}
function PrettyLS {
 colorls --light -A
}
function GitStat {git status}
function GoBack {Set-Location ..}
function GoBack2 { Set-Location ../.. }
function GetMyIp {curl -L tool.lu/ip}
function UpdateScoop {scoop update; scoop update *}
function UpdateChoco {choco upgrade chocolatey}
function FzfGitCheckout {
  $branch = $(git branch -a | fzf)
  if (-not $branch) {
    # cancel, do nothing
  }
  else {
    $target = $branch.Trim()
    if ($target.Contains("remote")) {
      $remote = $target
      $target1 = $remote.Split("/")
      $target2 = $target1[2]
      echo $target2
      git checkout -b $target2 $remote
    }
    else {
      echo $target
      git checkout $target
    }
  }
}

# $DefaultUser = 'spenc'
# Setup other alias
Set-Alias open Invoke-Item
Set-Alias .. GoBack
Set-Alias ... GoBack2
Set-Alias glola GitLogPretty
Set-Alias gst GitStat
Set-Alias myip GetMyIp
Set-Alias pls PrettyLS
Set-Alias fco FzfGitCheckout

Import-Module posh-git
Import-Module oh-my-posh
# Set theme for git and fonts
Set-Theme Paradox

Import-Module PSReadLine
# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

#Set the color for Prediction (auto-suggestion)
#Set-PSReadlineOption -Colors @{Prediction = 'DarkGreen' }

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'
Import-Module PSFzf
# enable all fzf internal alias 
Enable-PsFzfAliases
Import-Module ZLocation
Import-Module PSEverything
Import-Module PoShFuck
Import-Module git-aliases
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
