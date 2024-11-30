# Ensure the script can run with elevated privileges - Code from CTT
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as an Administrator!"
    break
}

## Install Chris Titus' profile first
irm "https://github.com/ChrisTitusTech/powershell-profile/raw/main/setup.ps1" | iex

## Install other programs
# Scoop install
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Scoop is not installed. Installing Scoop..."
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
} else {
    Write-Host "Scoop is already installed."
}

# Make Scoop downloads faster
scoop install aria2
scoop config aria2-warning-enabled false

# Add extras bucket in scoop
scoop install git
scoop bucket add extras

# Fastfetch install
scoop install fastfetch
Rename-Item -Path "~/.config/fastfetch/config.jsonc" -NewName ("config." + (Get-Date -Format 'dd-MM-yyyy.HH.mm.ss') + ".jsonc") -erroraction 'silentlycontinue'
fastfetch --gen-config
del ~\.config\fastfetch\config.jsonc
Copy-Item -Path ~\scoop\apps\fastfetch\current\presets\paleofetch.jsonc -Destination ~/.config/fastfetch/config.jsonc

# pacman-apt
irm cutt.ly/pacman-apt | iex

# oh-my-posh config
(Get-Content -Path "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\microverse-power.omp.json" -Raw) -split "`n" | 
ForEach-Object -Begin { $i = 0 } -Process { if ($i++ -eq 2) { '  "auto_upgrade": true,' } ; $_ } | 
Set-Content -Path "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\microverse-power.omp.json" -Encoding UTF8

## Install my profile
Rename-Item -Path $PROFILE.CurrentUserAllHosts -NewName ("profile." + (Get-Date -Format 'dd-MM-yyyy.HH.mm.ss') + ".ps1") -erroraction 'silentlycontinue'
irm https://raw.githubusercontent.com/ShadowElixir/better-powershell-profile/main/profile.ps1 >> $PROFILE.CurrentUserAllHosts
