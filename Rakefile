require 'data_mapper'
require_relative './app/app.rb'

task default: %w[auto_upgrade]
task migrate: %w[auto_migrate]

task :auto_upgrade do
  DataMapper.auto_upgrade!
end

task :auto_migrate do
  DataMapper.auto_migrate!
end
