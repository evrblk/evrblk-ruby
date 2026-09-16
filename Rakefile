# frozen_string_literal: true

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

begin
  require "rubocop/rake_task"
  RuboCop::RakeTask.new
rescue LoadError
  # rubocop is a development-only dependency
end

desc "Regenerate the Ruby protobuf/gRPC bindings from proto/"
task :protogen do
  protos = ["proto/evrblk/moab/v0/api.proto", "proto/evrblk/grackle/v1beta/api.proto"]

  protos.each do |proto|
    sh "bundle exec grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib --grpc_out=./lib #{proto}"
  end
end

task default: :test
