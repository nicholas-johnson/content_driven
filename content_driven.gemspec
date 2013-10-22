# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_driven/version'

Gem::Specification.new do |spec|
  spec.name          = "content_driven"
  spec.version       = ContentDriven::VERSION
  spec.authors       = ["Nicholas Johnson"]
  spec.email         = ["nicholas@forwardadvance.com"]
  spec.description   = %q{A clean, simple DSL for defining websites, no database required}
  spec.summary       = %q{Emphasised great Information Architecture, Metadata and SEO. Define your website using the simple Ruby DSL. Build your pages in HAML, ERB, MD, etc. Deploy via git.}
  spec.homepage      = "http://www.github.com/forwardadvance/content_driven"
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