# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "grpc"
gem "base64"

group :development do
  gem "rake"
  gem "grpc-tools"
  gem "test-unit"

  # Rubocop changes pretty quickly: new cops get added and old cops change
  # names or go into new namespaces. This is a library and we don't have
  # `Gemfile.lock` checked in, so to prevent good builds from suddenly going
  # bad, pin to a specific version number here. Try to keep this relatively
  # up-to-date, but it's not the end of the world if it's not.
  #
  # The latest version of rubocop is only compatible with Ruby 2.7+
  gem "rubocop", "1.57.2" if RUBY_VERSION >= "2.7"
end
