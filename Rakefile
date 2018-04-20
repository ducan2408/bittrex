require 'rubygems'
require 'bundler'
require 'bundler/setup'

begin
  $stderr.puts "install bundle"
  Bundler.setup(:default, :development)
  Bundler.require
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

task :default => :test