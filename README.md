# AnsibleLab
Vagrant configuration for a Development Training Lab

For Windows Users:

Please use the [Environment Setup File](https://github.com/FubarFast/AnsibleLab/blob/main/envsetup.ps1) for initial configuration of your environment.  

This will install:
- [Chocolatey Package Manager](https://chocolatey.org/)
- [Git](https://git-scm.com/)
- [GitHub CLI](https://cli.github.com/)
- [PoshGit](https://github.com/dahlbyk/posh-git)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

It will also disable Hyper-V if the feature is found to be enabled.

Once this is completed, you can run a git clone on the repo if you havn't already.

git clone https://github.com/FubarFast/AnsibleLab.git

You can then navigate to the newly created folder and run:
vagrant up