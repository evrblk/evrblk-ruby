# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require "evrblk/version"

Gem::Specification.new do |s|
  s.name = "evrblk"
  s.version = Evrblk::VERSION
  s.required_ruby_version = ">= 2.3.0"
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
    "rubygems_mfa_required" => "false",
  }

  ignored = Regexp.union(
    /\A\.editorconfig/,
    /\A\.git/,
    /\A\.rubocop/,
    /\A\.travis.yml/,
    /\A\.vscode/,
    /\A\.cursor/,
    /\Abin/,
    /\Atest/
  )
  s.files = `git ls-files`.split("\n").grep_v(ignored)
  s.require_paths = ["lib"]
end
