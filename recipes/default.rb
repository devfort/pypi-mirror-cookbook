# TODO: Make pypi mirror searchable.

include_recipe "python::pip"

python_pip "bandersnatch" do
  action :install
end

template "/etc/bandersnatch.conf" do
  source "bandersnatch.conf.erb"
  owner node.pypi_mirror.user
  group node.pypi_mirror.user
  mode "0644"
end

mirror "pypi" do
  target node.pypi_mirror.data_dir
  user node.pypi_mirror.user
  hostname node.pypi_mirror.apache.listen_hostname
  port node.pypi_mirror.apache.listen_port
  command "bandersnatch mirror"
  cookbook "mirror-core"
end
