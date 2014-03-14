#jboss_home = "#{node['jboss']['dir']}/#{node['jboss']['app']}"
#jboss_home = node['jboss']['dir']<<'/'<<node['jboss']['app']
#jboss_version = File.basename(node['jboss']['url'],".Final.tar.gz").split('-')[-1]

user node['jboss']['user']
group node['jboss']['user']

ark 'jboss' do
  url  node['jboss']['url']
  checksum node['jboss']['checksum']
  home_dir node['jboss']['home']
  version node['jboss']['version']
  owner node['jboss']['user']
  group node['jboss']['user']
end

# template environment variables used by init file
template "/etc/profile.d/#{node['jboss']['app']}.sh" do
  source "default.erb"
  mode 0755
end

template "#{node['jboss']['home']}/bin/standalone.conf" do
  source "standalone.conf.erb"
  mode 0644
  owner node['jboss']['user']
  group node['jboss']['user']
end

# link init file
#template "/etc/init.d/#{node['jboss']['app']}" do
#  source "init.erb"
#  mode 0755
#  action :create
#end

# start service
#service node['jboss']['app'] do
#  action [ :enable, :start ]
#end
