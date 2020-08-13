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
function GetMyIp {curl -L tool.lu/ip}
function UpdateScoop {scoop update; scoop update *}
function UpdateChoco {choco upgrade chocolatey}


# $DefaultUser = 'spenc'
# Setup other alias
Set-Alias open Invoke-Item
Set-Alias .. GoBack
Set-Alias glola GitLogPretty
Set-Alias gst GitStat
Set-Alias myip GetMyIp
Set-Alias pls PrettyLS

Import-Module posh-git
Import-Module oh-my-posh
# Set theme
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
Set-PSReadlineOption -Colors @{Prediction = 'DarkGreen' }

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'
Import-Module PSFzf
Import-Module ZLocation
Import-Module PSEverything
Import-Module PoShFuck
