require 'rake/testtask'
require_relative 'app'

task :default => [:dev]

task :dev do
  system("rerun rackup")
end

task :run do
  system("rackup")
end

task :db do
  system("mongod --dbpath db")
end

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
end

task :routes do
  App.routes.each do |route|
    puts "#{route.request_method.ljust(10)} #{route.path}"
  end
end
