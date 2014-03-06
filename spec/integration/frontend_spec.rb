require 'spec_helper'

# SELinux should be disabled
describe selinux do
  it { should be_disabled }
end

# Java
describe command('java -version 2>&1 | awk \'/version/{print $NF}\'') do
  it { should return_stdout '"1.7.0_51"' }
end

# Jboss
describe service('jboss') do
  it { should be_enabled }
  it { should be_running }
end
