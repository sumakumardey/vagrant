#Project Goals

Have you ever been in a situation where you want a cluster, but you have limited (or no) connectivity?

* A meetup?
* A plane? (yep, I show off Riak to my seat mates)
* A meeting room with miserable wifi?

This project was designed to allow deployment of multiple VM instances of riak, automatically joined, and then use some simple scripts to PUT & GET data and show Map Reduce capabilities.

getting started
=================================

This vagrant project will let you create a riak cluster of N nodes that will automatically be joined together.  For this to work you'll need an Ubuntu base box added to your Vagrant install with the name `ubuntu`, e.g.:

    $ vagrant box list
    ubuntu
    lucid32
    ...

You can grab pre-existing Ubuntu base boxes of the internet, or roll
your own using [veewee](https://github.com/jedi4ever/veewee/).  All testing for this project was performed using the default definition files for Ubuntu Precise (12.0.4 AMD64) available in the vewee project.

The .deb file for Riak 1.3 lives in the [files/](https://github.com/tylerhannan/vagrant-riak-cluster/files/) structure.  A bit wonky really...but it meets the stated need.

When the cluster is up and running, you can use the files in the [testdata/](https://github.com/tylerhannan/vagrant-riak-cluster/testdata/) folder to play with some simple sample data.  More information is available in the [ReadMe](https://github.com/tylerhannan/vagrant-riak-cluster/testdata/README.md) in that folder.

choosing the size of your cluster
=================================

By default running `vagrant up` will create a riak cluster
with 5 nodes. To change this edit the first line of code in
the `Vagrantfile`. It looks like:

    num_nodes = 5

choosing your storage backend
=============================

Riak supports several different [storage backends](http://docs.basho.com/Storage-Backends.html).
To be able to use Riak 2i the eLevelDB must be selected as your backend,
so that is what the default value is set to in the `Vagrantfile`. To select
a different one just change the following line in the `Vagrantfile`:

    riak_backend = "eleveldb"

All of the available options are listed in the comment above that line,
and of course can be found in the link provided.

riak control
===========================

Riak control has been enabled with-out security or ssl. You should not use riak control in production without ssl or authentication security enabled.

You can access the riak-control console by visiting http://33.33.33.10:8098/admin
