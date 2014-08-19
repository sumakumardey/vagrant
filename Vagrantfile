# -*- mode: ruby -*-
# vi: set ft=ruby :

#--- BEGIN config vars ---#

# Select the number of riak nodes in the cluster.
# There is a reason to use 5 (in production) that is explained in detail on the
# Basho blog.

num_nodes = 1

# Select the name of the box you prefer.
#
# This will only work with Ubuntu Precise (12.04 AMD 64) base boxes, but if the name
# you used when you added the box is different from 'ubuntu' 
# then change this value.

base_box = "ubuntu"

# Base IP value.
#
# Modify if desired.

base_ip = "31.33.33."

# Select the storage backend you want for Riak.
# To take advantage of 2i we must use eLevelDB.
#
# Valid options are:
#
#   bitcask
#   eleveldb
#   innostore
#   memory
#   multi

riak_backend = "bitcask"

# IP addresses can't start at one (i.e X.X.X.1) or complaints will
# come your way. This is the IP increment for the ip4 value.

ip_inc = 10

#--- END config vars ---#

Vagrant.configure("2") do |cluster|

  (1..num_nodes).each do |index|

    ip4       = index * ip_inc
    ip_addr   = "#{base_ip}#{ip4}"
    hostname  = "riak#{index}"
    prov_args = {
      :facter => {
        "ip_addr"      => ip_addr,
        "riak_backend" => riak_backend,
        "join_ip"      => "#{base_ip}#{ip_inc}",
        "n_val"        => 1
      }
    }

    cluster.vm.define hostname do |node|

      node.ssh.forward_agent = true
      node.vm.host_name      = hostname
      node.vm.box            = "precise64"
      node.vm.box_url        = "http://files.vagrantup.com/precise64.box"

      node.vm.network "private_network", ip: ip_addr
      node.vm.provider :virtualbox do |vb|  #
        vb.customize ["modifyvm", :id, "--memory", "512"]
      end

      node.vm.provision :puppet, prov_args do |puppet|
        puppet.manifests_path = "puppet"
        puppet.module_path    = "puppet"
        puppet.manifest_file  = "init.pp"
        # puppet.options = "--verbose --debug"
      end
    end
  end
end