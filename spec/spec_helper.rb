require 'bundler'

Bundler.require :development

Dir[File.expand_path('support/**/*.rb', __dir__)].sort.each { |f| require f }
