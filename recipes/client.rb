# HACK: Install pip/setuptools config for all users to work around https://github.com/pypa/pip/issues/309
users = [node['current_user']]
users += node['pypi_mirror']['client_users'] if node['pypi_mirror']['client_users']

users.each do |user|
  home = Dir.home(user)
  directory "#{home}/.pip" do
    recursive true
  end

  template "#{home}/.pip/pip.conf" do
    source "pip.conf.erb"
    owner user
    group user
    mode "0644"
  end
end
