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

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/keisukeYamagishi/xsort"
    spec.metadata["twitter_uri"] = "https://twitter.com/O_Linker_Error"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|bin/console|bin/setup|exe/xsort)/})
  end
  
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
