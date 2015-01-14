# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'views_count/version'

Gem::Specification.new do |spec|
  spec.name          = "views_count"
  spec.version       = ViewsCount::VERSION
  spec.authors       = ["Ben Zhang"]
  spec.email         = ["bzbnhang@gmail.com"]
  spec.summary       = %q{ViewsCount is a lightweight plugin to keep track of views of an ActiveRecord model.}
  spec.description   = %q{ViewsCount is a lightweight plugin to keep track of views of an ActiveRecord model.}
  spec.homepage      = "https://github.com/BenZhang/views_count"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
