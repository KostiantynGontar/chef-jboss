require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |u|
  u.pattern = 'spec/units/recipes/*_spec.rb'
end

RSpec::Core::RakeTask.new(:serverspec) do |i|
  i.pattern = 'spec/integration/*_spec.rb'
end

# Added by $kitchen init
begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end
