# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fetch_meizi/version'

Gem::Specification.new do |spec|
  spec.name          = "fetch_meizi"
  spec.version       = FetchMeizi::VERSION
  spec.authors       = ["soffolk"]
  spec.email         = ["zlx.star@gmail.com"]
  spec.description   = %q{Fetch the newest image from meizitu}
  spec.summary       = %q{Fetch the newest image from meizitu}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spen.add_dependency "nokogiri", "~> 1.5.9"
end
