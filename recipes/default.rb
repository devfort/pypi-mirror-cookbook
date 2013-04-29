include_recipe "python::pip"
python_pip "pep381client" do
  action :install
end

directory node.pypi_mirror.data_dir do
  owner node.pypi_mirror.user
  group node.pypi_mirror.user
  mode "0755"
end

template "/etc/init/pypi-mirror.conf" do
  source "services/pypi-mirror.conf.erb"
  owner node.pypi_mirror.user
  group node.pypi_mirror.user
  mode "0644"
end

service "pypi-mirror" do
  provider Chef::Provider::Service::Upstart
  action :start
end

log "Started mirroring pypi; tail /var/log/upstart/pypi-mirror.log to monitor."
