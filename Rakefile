require 'rake/testtask'
require 'json'
require_relative 'app/app'

task :default => [:dev]

desc "Rerun the app"
task :dev do
  system("rerun rackup")
end

desc "Run the app (synchronously)"
task :run do
  vcap_services = JSON.parse ENV['VCAP_SERVICES']
  mongodb_uri = vcap_services['mlab'].first['credentials']['uri']
  system("MONGODB_URI=#{mongodb_uri} rackup -p #{ENV['PORT']}")
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
