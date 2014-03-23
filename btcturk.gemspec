# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'btcturk/version'

Gem::Specification.new do |spec|
  spec.name          = 'btcturk'
  spec.version       = Btcturk::VERSION
  spec.authors       = ['Kerem Bozdas']
  spec.email         = ['krmbzds.github@gmail.com']
  spec.summary       = %q{A simple ruby library to interface with BTCTurk API.}
  spec.description   = %q{A simple ruby library to interface with BTCTurk API.}
  spec.homepage      = 'https://github.com/krmbzds/btcturk'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['btcturk']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
