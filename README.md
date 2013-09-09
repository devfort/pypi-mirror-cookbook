Description
===========

This cookbook configures the machine as a mirror of https://pypi.python.org/.

Requirements
============

Platform
--------

* Ubuntu 13.04 (that's all we support at /dev/fort for now, so that's all I've tested.)

Attributes
==========

Cookbook attributes are named under the `pypi_mirror` namespace.

* `node['pypi_mirror']['user']` - user to host PyPI mirror as, defaults to `fort`
* `node['pypi_mirror']['data_dir']` - directory to store PyPI mirror in, defaults to '/data/pypi'
* `node['pypi_mirror']['apache']['listen_hostname']` - Hostname to listen on for PyPI Apache virtualhost, defaults to '*'
* `node['pypi_mirror']['apache']['listen_port']` - Port to listen on for PyPI Apache virtualhost, defaults to '80'

Recipes
=======

The main entrypoint for this cookbook is the `default` recipe.

Usage
=====

Include `pypi-mirror` and it will start replicating https://pypi.python.org/. This will take a _very_ long time (probably a couple of days), and require tens of gigabytes of storage (~60GB, at time of writing). You have been warned.

You can keep an eye on the mirroring progress by running `tail`ing `/var/log/upstart/pypi-mirror.log`.

TODO
====

- `client` recipe
