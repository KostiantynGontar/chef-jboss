require 'chefspec'

# Uncomment to use ChefSpec's Berkshelf extension
require 'chefspec/berkshelf'
# Uncomment to use ChefSpec's Chef-Zero extension
require 'chefspec/server'

RSpec.configure do |config|
  # Specify the path for Chef Solo to find cookbooks
  # config.cookbook_path = '~/.berkshelf/cookbooks/'

  # Specify the path for Chef Solo to find roles
  # config.role_path = '/~/work/devops/roles'

  # Specify the Chef log_level (default: :warn)
  # config.log_level = :info

  # Specify the path to a local JSON file with Ohai data
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from
  # config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from
  # config.version = '12.04'
end
# Uncoment to use Coverage report BETA!
#at_exit { ChefSpec::Coverage.report! }
