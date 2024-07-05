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
## 🎨 Further configuration (Recommened)

1. Download [Windows Terminal](https://github.com/microsoft/terminal).
2. Use [dracula theme](https://github.com/dracula/powershell).
3. Use [0xProto font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip).
4. In Windows Terminal settings, go to `Appearance` and disable `Hide the title bar` and `Always show tabs`.
   
   4a. If you want to use tabs, make sure to enable `Use acrylic material in the tab row`.
5. In Windows Terminal profiles settings, go to `Powershell` or `Defaults`, set Cursor shape to `Double underscore`.
6. For transparency, set background opacity to `75%` and enable `Enable acrylic material`.

   *(It might look better without transparency)*

## 🛠️ Disable "Loading personal and system profiles took *** ms"

1. Open Windows Terminal settings
2. Click Powershell (in Profiles)
3. Select Command line
4. Add `-nologo` to the end
