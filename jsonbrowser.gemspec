# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonbrowser/version'

Gem::Specification.new do |spec|
  spec.name          = "jsonbrowser"
  spec.version       = JsonBrowser::VERSION
  spec.authors       = ["Levente Bagi"]
  spec.email         = ["bagilevi@gmail.com"]

  spec.summary       = %q{Sends a JSON structure to website where you can browse it}
  spec.description   = %q{A tool for making sense of large JSON structures while debugging. It sends the JSON to a website and outputs a direct URL where you can browse the JSON structure.}
  spec.homepage      = "https://github.com/bagilevi/jsonbrowser-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">= 1.7.3", "< 3"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
