
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "xsort/version"

Gem::Specification.new do |spec|
  spec.name          = "xsort"
  spec.version       = Xsort::VERSION
  spec.authors       = ["keisuke"]
  spec.email         = ["jam330157@gmail.com"]
  spec.summary       = %q{Sort by file.}
  spec.description   = %q{Sort the file tree next to Xcode by file name.}
  spec.homepage      = "https://github.com/keisukeYamagishi/xsort"
  spec.license       = "MIT"
  spec.files         = [".gitignore", ".rspec", ".travis.yml", "CODE_OF_CONDUCT.md", "Gemfile", "LICENSE.txt", "README.md", "Rakefile","lib/xsort/version.rb", "xsort.gemspec"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
