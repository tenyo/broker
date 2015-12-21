#require 'rake/testtask'
require 'rspec/core/rake_task'
require 'dm-migrations'

desc "List all routes for this application"
task :routes do
  puts "Showing all routes"
  puts `egrep -e namespace -e 'get|post|put|delete.*do$' routes/*.rb | sed 's/ do$//'`
end

desc "Runs rspec tests"
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.pattern = Dir.glob('spec/*_spec.rb')
  t.rspec_opts = '--format documentation'
  # t.rspec_opts << ' more options'
  # t.rcov = true
end

namespace :db do
  namespace :hosts do
    require './models/hosts.rb'
    task :migrate do
      DataMapper.auto_migrate!
    end
  
    task :upgrade do
      DataMapper.auto_upgrade! 
    end
  end
end

task :default => ["rspec"]

