# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'choshi/version'

Gem::Specification.new do |spec|
  spec.name          = "choshi"
  spec.version       = Choshi::VERSION
  spec.authors       = ["Sho Kusano"]
  spec.email         = ["sho-kusano@cookpad.com"]
  spec.description   = %q{Simple Decorator gem for Rails 3 and 4}
  spec.summary       = %q{Simple Decorator gem for Rails 3 and 4}
  spec.homepage      = "https://github.com/rosylilly/choshi"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'mocha'

  spec.add_dependency 'activesupport'
end
