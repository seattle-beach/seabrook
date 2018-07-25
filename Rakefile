require 'rake/testtask'
require_relative 'app'

task :default => [:dev]

desc "Rerun the app"
task :dev do
  system("rerun rackup")
end

desc "Run the app (synchronously)"
task :run do
  system("rackup")
end

desc "Run MongoDB server (synchronously)"
task :db do
  system("mkdir -p db")
  system("mongod --dbpath db")
end

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
end

desc "List routes"
task :routes do
  App.routes.each do |route|
    puts "#{route.request_method.ljust(10)} #{route.path}"
  end
end
