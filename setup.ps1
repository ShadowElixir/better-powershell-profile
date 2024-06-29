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

# Install git
scoop install git

# Fastfetch install
scoop install fastfetch
Rename-Item -Path "~/.config/fastfetch/config.jsonc" -NewName ("config." + (Get-Date -Format 'dd-MM-yyyy.HH.mm.ss') + ".jsonc") -erroraction 'silentlycontinue'
fastfetch --gen-config
del ~\.config\fastfetch\config.jsonc
Copy-Item -Path ~\scoop\apps\fastfetch\current\presets\paleofetch.jsonc -Destination ~/.config/fastfetch/config.jsonc

# GUI is bloat
scoop bucket add extras
scoop install vcredist2010
scoop install ffmpeg
scoop install youtube-dl
scoop install yt-dlp
scoop install mplayer

# pacman-apt
irm cutt.ly/pacman-apt | iex
