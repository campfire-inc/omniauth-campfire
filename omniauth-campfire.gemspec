
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/campfire/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-campfire"
  spec.version       = OmniAuth::Campfire::VERSION
  spec.authors       = ["Takashi Nakagawa"]
  spec.email         = ["tak1240@gmail.com"]

  spec.summary       = %q{The official OmniAuth strategy for CAMPFIRE.}
  spec.homepage      = "https://github.com/campfire-inc/omniauth-campfire"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth"
  spec.add_dependency "omniauth-oauth2"
  spec.add_development_dependency "bundler", "~> 1.16"
end
