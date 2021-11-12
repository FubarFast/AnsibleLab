# install chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# required tooling
$packages = @(
    "git"           # Git
    "poshgit"       # PowerShel Git integration
    "gh"            # GitHub CLI    
    "vscode"        # Visual Studio Code
    "virtualbox"    # Virtual Box
    "vagrant"       # Vagrant
)

# loop through package list and install
foreach ($package in $packages)
{
    cinst $package -y 
}

# check hyperv status
$feature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

# disable hyperv (conflicts with virtualbox)
if ($feature.State -like 'Enabled')
{
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

# check for ansible folder and create if absent
if (!(Test-Path C:\Code\Ansible\))
{
    New-Item -ItemType Directory -Path C:\Code\Ansible
}
