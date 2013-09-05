include_recipe "python::pip"

python_pip "bandersnatch" do
  action :install
end

directory node.pypi_mirror.data_dir do
  owner node.pypi_mirror.user
  group node.pypi_mirror.user
  mode "0755"
end

{
  "bandersnatch.conf.erb" => "/etc/bandersnatch.conf",
  "services/pypi-mirror.conf.erb"      => "/etc/init/pypi-mirror.conf",
  "services/pypi-mirror-shim.conf.erb" => "/etc/init/pypi-mirror-shim.conf",
}.each do |src, target|
  template target do
    source src
    owner node.pypi_mirror.user
    group node.pypi_mirror.user
    mode "0644"
  end
end

service "pypi-mirror-shim" do
  provider Chef::Provider::Service::Upstart
  action :restart
end

log "Started mirroring pypi; tail /var/log/upstart/pypi-mirror.log to monitor."
