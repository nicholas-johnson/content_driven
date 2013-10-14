# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sodium/version'

Gem::Specification.new do |spec|
  spec.name          = "sodium"
  spec.version       = Sodium::VERSION
  spec.authors       = ["Nicholas Johnson"]
  spec.email         = ["nicholas@forwardadvance.com"]
  spec.description   = %q{A simple DSL for defining websites}
  spec.summary       = %q{Create your website in HAML, ERB, MD, etc}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "activesupport"
end
