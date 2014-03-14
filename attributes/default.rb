default['jboss']['dir'] ="/opt"
default['jboss']['url'] = "http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz" 
default['jboss']['checksum'] = "88fd3fdac4f7951cee3396eff3d70e8166c3319de82d77374a24e3b422e0b2ad"
default['jboss']['user'] = "jboss"
default['jboss']['app'] = 'jboss'
default['jboss']['bind'] = '0.0.0.0'

default['jboss']['home'] = "#{node['jboss']['dir']}/#{node['jboss']['app']}"
default['jboss']['version'] = "#{File.basename(node['jboss']['url'],".Final.tar.gz").split('-')[-1]}"
