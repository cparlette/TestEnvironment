# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.network "forwarded_port", guest: 2609, host: 2609
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "python"
    chef.json = {
      "sshkey" => {
        "user" => "vagrant",
        "group" => "vagrant",
        "public_key" => IO.read(File.expand_path("~/.ssh/id_dsa.pub")),
        "private_key" => IO.read(File.expand_path("~/.ssh/id_dsa"))
      },
      "nad" => {
        "nad_script" => {
          "name" => "cpu.sh",
          "subdir" => "linux"
        },
        "nad_script" => {
          "name" => "disk.sh",
          "subdir" => "linux"
        },
        "nad_script" => {
          "name" => "if.sh",
          "subdir" => "linux"
        },
        "nad_script" => {
          "name" => "vm.sh",
          "subdir" => "linux"
        }
      }
    }
    chef.add_recipe "basic-setup"
    chef.add_recipe "nodejs"
    chef.add_recipe "nad"
    
    #chef.add_recipe "circonus"
  end
end
