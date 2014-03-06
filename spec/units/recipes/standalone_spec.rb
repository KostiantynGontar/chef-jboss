require_relative '../spec_helper'

describe 'jboss::standalone' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'set jboss attributes' do
    expect(chef_run.node['jboss']['home']).to eq('/usr/local/jboss')
    expect(chef_run.node['jboss']['user']).to eq('jboss')
    expect(chef_run.node['jboss_user']).to eq('jboss')
  end

  it 'Include cookbooks' do
    expect(chef_run).to include_recipe('maven')
  end
 
  it 'creates a user' do
    expect(chef_run).to create_user('jboss')
  end 

  it 'install jboss with Ark' do
    expect(chef_run).to create_directory('/usr/local/jboss').with(user:'jboss')
  end
    
  it 'create env template' do
    expect(chef_run).to create_file('/etc/default/jboss').with(mode:'755')
  end

  it 'create init script' do
    expect(chef_run).to create_file('/etc/init.d/jboss').with(user:'root',group:'root',mode:'755')
  end

  it 'create startup script and config' do
    expect(chef_run).to create_file('/usr/local/jboss/bin/standalone.sh').with(user:'jboss',group:'jboss',mode:'755')
    expect(chef_run).to create_file('/usr/local/jboss/standalone/configuration/standalone.xml').with(user:'jboss')
  end

  it 'create service and run' do
    expect(chef_run).to enable_service('jboss')
    expect(chef_run).to start_service('jboss')
  end
end
