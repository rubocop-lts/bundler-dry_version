# frozen_string_literal: true

require_relative "lib/bundler/dry_version/version"

Gem::Specification.new do |spec|
  spec.name = "bundler-dry_version"
  spec.version = Bundler::DryVersion::VERSION
  spec.authors = ["Peter Boling"]
  spec.email = ["peter.boling@gmail.com"]

  spec.summary = "Bundler + gemspec behavior example"
  spec.description = "Demonstrates some confusing behavior of bundler + gemspec
  https://github.com/rubygems/rubygems/discussions/6726#discussioncomment-6130139"
  spec.homepage = "https://github.com/rubygems/rubygems/discussions/6726#discussioncomment-6130139"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rubocop-lts/bundler-dry_version"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # The version here will be constrained to a much lower version that the latest release, which is v24.
  # It is also constrained to a precise, specific, version (not ~> or >=)
  # See Gemfile, and Gemfile.lock for the interplay.
  spec.add_development_dependency "rubocop-lts", "8.1.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
