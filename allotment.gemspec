# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'allotment/version'

Gem::Specification.new do |spec|
  spec.name          = "allotment"
  spec.version       = Allotment::VERSION
  spec.authors       = ["Daniel Angel-Bradford"]
  spec.email         = ["locusdelicti@gmail.com"]
  spec.description   = %q{A gem to check Internet quotas}
  spec.summary       = %q{Check internet quotas from the command line}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mechanize"
  spec.add_dependency "trollop"
  spec.add_dependency "pushover"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-debugger'
  # add mechanize


end