require "bundler"

Bundler.require :development

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f }
