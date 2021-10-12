# frozen_string_literal: true

require_relative "lib/short_pixel/version"

Gem::Specification.new do |spec|
  spec.name          = "short_pixel"
  spec.version       = ShortPixel::VERSION
  spec.authors       = ["Jared"]
  spec.email         = ["jaredmswanson@gmail.com"]

  spec.summary       = "Ruby bindings for ShortPixel Api"
  spec.description   = "Ruby bindings for ShortPixel Api. ShortPixel Api docs can be found here: https://shortpixel.com/api-docs"
  spec.homepage      = "https://github.com/jaredswanson/short_pixel"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency "activesupport", "~> 6.1"
  spec.add_dependency "faraday", "~> 1.8"
  spec.add_dependency "faraday_middleware", "~> 1.1"
end
