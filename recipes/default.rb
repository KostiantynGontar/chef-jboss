jboss_home = "#{node['jboss']['dir']}/#{node['jboss']['app']}"
jboss_version = File.basename(node['jboss']['url'],".Final.tar.gz").split('-')[-1]

user node['jboss']['user']

ark 'jboss' do
  url  node['jboss']['url']
  checksum node['jboss']['checksum']
  home_dir jboss_home
  version jboss_version
  owner node['jboss']['user']
end

# template environment variables used by init file
#template "/etc/default/#{jboss_user}" do
#  source "default.erb"
#  mode "0755"
#end

# link init file
link "/etc/init.d/#{node['jboss']['app']}" do
  to "#{jboss_home}/bin/standalone.sh"
end

# start service
service node['jboss']['app'] do
  action [ :enable, :start ]
end
