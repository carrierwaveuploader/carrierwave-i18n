lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'carrierwave-i18n/version'

Gem::Specification.new do |spec|
  spec.name = 'carrierwave-i18n'
  spec.version = CarrierWaveI18n::VERSION
  spec.authors = ['Mehdi Lahmam']
  spec.email = ['mehdi@craftsmen.io']
  spec.summary = 'Locales for CarrierWave'
  spec.license = 'MIT'

  github_root_uri = 'https://github.com/carrierwaveuploader/carrierwave-i18n'
  spec.homepage = "#{github_root_uri}/tree/v#{spec.version}"
  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'bug_tracker_uri' => "#{github_root_uri}/issues",
    'documentation_uri' => "https://rubydoc.info/gems/#{spec.name}/#{spec.version}"
  }

  spec.files = Dir['{lib,rails}/**/*', '*.{md,txt}']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_runtime_dependency 'carrierwave', '>= 3.0.0', '< 4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'i18n-spec', '~> 0.6.0'
  spec.add_development_dependency 'railties'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
