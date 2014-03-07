require 'spec_helper'

describe user('jboss') do
    it { should exist }
    it { should belong_to_group 'jboss' }
end

describe file('/opt/jboss') do
    it { should be_directory }
    it { should be_owned_by 'jboss' }
    it { should be_grouped_into 'jboss' }
    it { should be_linked_to '/usr/local/jboss-7.1.1' }
end

describe file('/etc/profile.d/jboss.sh') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_executable }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should contain '/opt/jboss' }
    it { should contain 'jboss' }

describe file('/opt/jboss/bin/standalone.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'jboss' }
    it { should be_grouped_into 'jboss' }
    it { should contain '0.0.0.0' }
end

#describe service('jboss') do
#  it { should be_enabled }
#  it { should be_running }
#end

#[8080,4447].each do |port|
#  describe port(port) do
#    it { should be_listening.with('tcp') }
#  end
#end
