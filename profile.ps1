# Display fastfetch
fastfetch -l "Windows 7"

# GUI is bloat
function youtube { yt-dlp $args -o - | mplayer -cache 64000 -vo caca - }

# oh-my-posh
oh-my-posh init pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/microverse-power.omp.json | Invoke-Expression
