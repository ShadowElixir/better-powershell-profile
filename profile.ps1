# Display fastfetch
fastfetch -l "Windows 7"

# Network Utilities
function Get-IPInfo { (Get-PubIP) | ForEach-Object {curl "https://api.db-ip.com/v2/free/$_" } }

# pacman-apt
Import-Module "pacman-apt"

# Useful Shortcuts
function vs { powershell "irm cutt.ly/manyscripts | iex" }
function ms { powershell "irm cutt.ly/manyscripts | iex" }
function sos { powershell "irm cutt.ly/shadowos | iex" }
function shadowos { powershell "irm cutt.ly/shadowos | iex" }
function debloat { powershell "irm christitus.com/win | iex" }
function act { powershell "irm massgrave.dev/get | iex" }

# oh-my-posh
oh-my-posh init pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/microverse-power.omp.json | Invoke-Expression
