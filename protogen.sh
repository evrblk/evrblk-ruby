grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib/evrblk --grpc_out=./lib/evrblk ./proto/moab/preview/api.proto
grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib/evrblk --grpc_out=./lib/evrblk ./proto/myaccount/preview/api.proto
grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib/evrblk --grpc_out=./lib/evrblk ./proto/grackle/preview/api.proto
grpc_tools_ruby_protoc -I ./proto --ruby_out=./lib/evrblk --grpc_out=./lib/evrblk ./proto/iam/preview/api.proto


