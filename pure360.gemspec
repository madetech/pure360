# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pure360/version'

Gem::Specification.new do |spec|
  spec.name          = "pure360"
  spec.version       = Pure360::VERSION
  spec.authors       = ["Emile"]
  spec.email         = ["emile.swarts123@gmail.com"]
  spec.description   = %q{Interact with the Pure360 email marketing platform}
  spec.summary       = %q{A wrapper tailored for interacting with the Pure360 email marketing platform}
  spec.homepage      = "https://github.com/madebymade/pure360"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.files         = Dir['lib/**/*.rb']

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
