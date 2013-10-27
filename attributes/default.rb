default['pypi_mirror']['user'] = 'fort'
default['pypi_mirror']['data_dir'] = '/data/pypi'
default['pypi_mirror']['remote_pypi'] = 'https://pypi.python.org'

default['pypi_mirror']['apache']['listen_hostname'] = '*'
default['pypi_mirror']['apache']['listen_port'] = '80'

override['apache']['default_site_enabled'] = false
