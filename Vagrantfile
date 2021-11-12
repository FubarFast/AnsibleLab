
Vagrant.configure("2") do |config|

  # configures target node for testing of ansible configurations
  config.vm.define "targetnode" do |targetnode|
    # vagrant cloud image: https://app.vagrantup.com/ubuntu/boxes/focal64
    targetnode.vm.box = "ubuntu/focal64"
    # node hostanme
    targetnode.vm.hostname = 'targetnode'
    # node network address
    targetnode.vm.network "private_network", ip: "10.10.0.20"
      # forward 443 on node to 2443 on host
    targetnode.vm.network "forwarded_port", guest: 443, host: 2443
    # customize node virtualbox settings
    targetnode.vm.provider "virtualbox" do |vb|
      # customize the amount of memory on the VM:
      vb.memory = "1024"
      # customize the amount of processors on the VM:
      vb.cpus = "1"
      # customize the amount of video memory on the VM:
      vb.customize ["modifyvm", :id, "--vram", "32"]
    end
    
  end
  
  # configures development node to pull code from host and run ansible against target
  config.vm.define "devnode" do |devnode|
    # vagrant cloud image: https://app.vagrantup.com/ubuntu/boxes/focal64
    devnode.vm.box = "ubuntu/focal64"
    # node hostanme
    devnode.vm.hostname = 'devnode'  
    # node network address
    devnode.vm.network "private_network", ip: "10.10.0.10"
    # forward 443 on node to 1443 on host
    devnode.vm.network "forwarded_port", guest: 443, host: 1443
    # syncs host code folder / assumes path specified exists
    devnode.vm.synced_folder 'C:\Code\Ansible', '/ansible'
    # customize node virtualbox settings
    devnode.vm.provider "virtualbox" do |vb|
      # display the VirtualBox GUI when booting the machine
      # vb.gui = true
      # customize the amount of memory on the VM:
      vb.memory = "1024"
      # customize the amount of processors on the VM:
      vb.cpus = "1"
      # customize the amount of video memory on the VM:
      vb.customize ["modifyvm", :id, "--vram", "64"]
    end
    # provisions node configuration and tooling
    devnode.vm.provision "shell", path: "./scripts/devnode-bootstrap.sh"
  end

end
