name             "jboss"
maintainer       "Kostiantyn Gontar"
maintainer_email "kostiantyn_gontar@epam.com"
license          "Apache v2.0"
description      "Installs/Configures jboss"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

%w{ ark maven }.each do |cb|
  depends cb
end

recipe "jboss", "installs jboss from the jboss community site"

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end
