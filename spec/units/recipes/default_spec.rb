require_relative '../spec_helper'

describe 'jboss::default' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'Include standalone cookbook' do

    expect(chef_run).to include_recipe('jboss::standalone')
  end

end
