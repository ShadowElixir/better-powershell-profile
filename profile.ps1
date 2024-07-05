# Display fastfetch
fastfetch -l "Windows 7"

# Initial GitHub.com connectivity check with 1 second timeout - Code from Chris Titus
$canConnectToGitHub = Test-Connection github.com -Count 1 -Quiet -TimeoutSeconds 1

# Check for Profile Updates - Code from Chris Titus
function UpdateProf {
    if (-not $global:canConnectToGitHub) {
        return
    }

    try {
        $url = "https://raw.githubusercontent.com/ShadowElixir/better-powershell-profile/main/profile.ps1"
        $oldhash = Get-FileHash $PROFILE.CurrentUserAllHosts
        Invoke-RestMethod $url -OutFile "$env:temp/profile.ps1"
        $newhash = Get-FileHash "$env:temp/profile.ps1"
        if ($newhash.Hash -ne $oldhash.Hash) {
            Copy-Item -Path "$env:temp/profile.ps1" -Destination $PROFILE.CurrentUserAllHosts -Force
            Write-Host "Profile has been updated. Please restart your shell to reflect changes" -ForegroundColor Blue
        }
    } catch {
        Write-Error "Unable to check for `$PROFILE.CurrentUserAllHosts updates"
    } finally {
        Remove-Item "$env:temp/profile.ps1" -ErrorAction SilentlyContinue
    }
}
UpdateProf

# Network Utilities
function Get-IPInfo { (Get-PubIP) | ForEach-Object {curl "https://api.db-ip.com/v2/free/$_" } }

# pacman-apt
Import-Module "pacman-apt"
Import-Module "gsudoModule"
function sudo { gsudo "Import-Module pacman-apt; $args" }

# Useful Shortcuts
function vs { powershell "irm cutt.ly/manyscripts | iex" }
function ms { powershell "irm cutt.ly/manyscripts | iex" }
function sos { powershell "irm cutt.ly/shadowos | iex" }
function shadowos { powershell "irm cutt.ly/shadowos | iex" }
function debloat { powershell "irm christitus.com/win | iex" }
function act { powershell "irm massgrave.dev/get | iex" }

# oh-my-posh
oh-my-posh init pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/microverse-power.omp.json | Invoke-Expression
