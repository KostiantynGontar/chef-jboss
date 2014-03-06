jboss_home = node['jboss']['dir'] + node['jboss']['app']

user node['jboss']['user']

ark 'jboss' do
  url  node['jboss']['url']
  checksum node['jboss']['checksum']
  home_dir "#{jboss_home}"
#  version node['jboss']['version']
  owner node['jboss']['user']
  group node['jboss']['user']
end

# template environment variables used by init file
#template "/etc/default/#{jboss_user}" do
#  source "default.erb"
#  mode "0755"
#end

# link init file
template "/etc/init.d/#{node['jboss']['app']}" do
  to "#{jboss_home}/bin/standalone.sh"
end

# start service
service jboss_user do
  action [ :enable, :start ]
end
