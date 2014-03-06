require_relative '../spec_helper'

describe 'jboss::default' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'set jboss attributes' do
    expect(chef_run.node['jboss_home']).to eq('/opt/jboss')
    expect(chef_run.node['jboss']['user']).to eq('jboss')
    expect(chef_run.node['jboss_version']).to eq('7.1.1')
  end

  it 'creates a user' do
    expect(chef_run).to create_user('jboss')
  end 

  it 'install jboss with Ark' do
    expect(chef_run).to create_directory('/opt/jboss').with(user:'jboss')
  end
    
  it 'create init script' do
    expect(chef_run).to create_link('/etc/init.d/jboss').with(to:'/opt/jboss/bin/standalone.sh')
  end

  it 'create service and run' do
    expect(chef_run).to enable_service('jboss')
    expect(chef_run).to start_service('jboss')
  end
end
