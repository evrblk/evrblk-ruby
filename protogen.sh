bundle exec grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib/evrblk --grpc_out=./lib/evrblk ./proto/moab/v0/api.proto
bundle exec grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib/evrblk --grpc_out=./lib/evrblk ./proto/grackle/v1beta/api.proto
