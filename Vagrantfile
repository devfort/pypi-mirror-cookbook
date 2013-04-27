# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "pypi-mirror-berkshelf"
  config.vm.box = "npm-mirror"
  # TODO: Find a suitable basebox for Vagrant (we need dozens of gigs!)
  # TODO: VM box URL
  # config.vm.box_url = ""

  # config.vm.network :forwarded_port, guest: 5984, host: 5984

  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'pypi_mirror' => {
        'data_dir' => '/home/vagrant/pypi',
        'user' => 'vagrant'
      }
    }

    chef.run_list = [
        "recipe[pypi-mirror::default]",
    ]
  end
end
