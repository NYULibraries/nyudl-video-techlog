# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyudl/video/techlog/version'

Gem::Specification.new do |spec|
  spec.name          = "nyudl-video-techlog"
  spec.version       = Nyudl::Video::Techlog::VERSION
  spec.authors       = ["Joseph Pawletko"]
  spec.email         = ["jgpawletko@gmail.com"]
  spec.description   = %q{Gem encapsulates functionality required to deal with various video digitization techlog files generated as part of the NYU DLTS Video capture workflow.}
  spec.summary       = %q{Library for NYU DLTS Video Techlog files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakefs"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "fuubar", "~> 1.3.2"

  spec.add_dependency "nokogiri", "~> 1.6.1"
end
