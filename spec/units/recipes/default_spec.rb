require 'chefspec'
require 'chefspec/berkshelf'

describe 'jboss::default' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'set jboss attributes' do
    expect(chef_run.node['jboss']['user']).to eq('jboss')
  end

  it 'creates a user' do
    expect(chef_run).to create_user('jboss')
    expect(chef_run).to create_group('jboss')
  end 
end
