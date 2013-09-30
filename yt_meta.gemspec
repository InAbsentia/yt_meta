# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yt_meta/version'

Gem::Specification.new do |spec|
  spec.name          = "yt_meta"
  spec.version       = YtMeta::VERSION
  spec.authors       = ["Brent Yoder"]
  spec.email         = ["brent@bpyoder.com"]
  spec.description   = "A tiny gem that pulls metadata for a specified video from Google's Youtube API"
  spec.summary       = "A tiny gem that pulls metadata for a specified video from Google's Youtube API"
  spec.homepage      = "https://github.com/InAbsentia/yt_meta"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "vcr", "~> 2.6.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "webmock", "~> 1.13.0"
end
