# 🎨 Better Powershell Profile
A new powershell profile based on [Chris Titus' profile](https://github.com/ChrisTitusTech/powershell-profile). 

## ⚡ One Line Install (Elevated PowerShell Recommended)

Execute the following command in an elevated PowerShell Core window to install the PowerShell profile:

```
irm cutt.ly/powerprofile | iex
```

For anything other than Powershell Core:
```
pwsh -Command "irm cutt.ly/powerprofile | iex"
```

## 🛠️ Disable "Loading personal and system profiles took *** ms"

1. Open Windows Terminal settings
2. Click Powershell (in Profiles)
3. Select Command line
4. Add `-nologo` to the end
