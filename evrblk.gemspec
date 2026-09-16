# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require "evrblk/version"

Gem::Specification.new do |s|
  s.name = "evrblk"
  s.version = Evrblk::VERSION
  s.required_ruby_version = ">= 3.1.0"
  s.summary = "Ruby bindings for the Everblack API"
  s.description = "Build simple, secure, scalable systems with Everblack. " \
                  "See https://everblack.dev for details."
  s.authors = ["Stanislav Spiridonov", "Everblack"]
  s.email = "stanislav@spiridonov.pro"
  s.homepage = "https://everblack.dev"
  s.license = "MIT"

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/evrblk/evrblk-ruby/issues",
    # "changelog_uri" =>
    #   "https://github.com/evrblk/evrblk-ruby/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://everblack.dev/docs",
    "github_repo" => "ssh://github.com/evrblk/evrblk-ruby",
    "homepage_uri" => "https://everblack.dev",
    "source_code_uri" => "https://github.com/evrblk/evrblk-ruby",
    "rubygems_mfa_required" => "true"
  }

  s.files = Dir.glob(
    [
      "lib/**/*.rb",
      "proto/**/*.proto",
      "README.md",
      "LICENSE",
      "Gemfile",
      "evrblk.gemspec"
    ],
    base: __dir__
  )
  raise "Cannot build evrblk.gemspec: file glob returned no files" if s.files.empty?

  s.require_paths = ["lib"]
end
