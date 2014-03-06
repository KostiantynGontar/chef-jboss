require 'spec_helper'

describe file('/opt/jboss') do
    it { should be_directory }
    it { should be_owned_by 'jboss' }
end

describe file('/etc/init.d/jboss') do
    it { should be_linked_to '/opt/jboss/bin/standalone.sb' }
    it { should be_executable }
end

describe service('jboss') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8080) do
    it { should be_listening.with('tcp') }
end
