lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "carrierwave-i18n/version"

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-i18n"
  spec.version       = CarrierWaveI18n::VERSION
  spec.authors       = ["Mehdi Lahmam"]
  spec.email         = ["mehdi@craftsmen.io"]

  spec.summary       = "Locales for CarrierWave"
  spec.homepage      = "https://github.com/carrierwaveuploader/carrierwave-i18n"
  spec.license       = "MIT"

  spec.files         = Dir["{lib,rails}/**/*", "*.{md,txt}"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "i18n-spec", "~> 0.6.0"
  spec.add_development_dependency "railties"
end
