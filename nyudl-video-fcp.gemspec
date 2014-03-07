# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyudl/video/fcp/version'

Gem::Specification.new do |spec|
  spec.name          = "nyudl-video-fcp"
  spec.version       = Nyudl::Video::Fcp::VERSION
  spec.authors       = ["Joseph Pawletko"]
  spec.email         = ["jgpawletko@gmail.com"]
  spec.description   = %q{Gem encapsulates functionality required to deal with Apple Final Cut Pro XML files generated as part of the NYU DLTS Video capture workflow.}
  spec.summary       = %q{Library for NYU DLTS Final Cut Pro XML files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
