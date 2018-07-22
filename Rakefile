require 'rake/testtask'

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
