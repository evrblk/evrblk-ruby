# frozen_string_literal: true

module Evrblk::IAM::Preview
    class Client
      def initialize(request_signer, endpoint)
        @grpc = Evrblk::IAM::Preview::IAMPreviewApi::Stub.new(endpoint, :this_channel_is_insecure)
        @request_signer = request_signer
      end
    
      def create_role(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::CreateRoleRequest)
        @grpc.create_role(request, metadata: @request_signer.sign(request))
      end

      def get_role(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::GetRoleRequest)
        @grpc.get_role(request, metadata: @request_signer.sign(request))
      end

      def update_role(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::UpdateRoleRequest)
        @grpc.update_role(request, metadata: @request_signer.sign(request))
      end
      
      def list_roles(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::ListRolesRequest)
        @grpc.list_roles(request, metadata: @request_signer.sign(request))
      end

      def delete_role(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::DeleteRoleRequest)
        @grpc.delete_role(request, metadata: @request_signer.sign(request))
      end

      def create_user(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::CreateUserRequest)
        @grpc.create_user(request, metadata: @request_signer.sign(request))
      end

      def get_user(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::GetUserRequest)
        @grpc.get_user(request, metadata: @request_signer.sign(request))
      end

      def update_user(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::UpdateUserRequest)
        @grpc.update_user(request, metadata: @request_signer.sign(request))
      end

      def list_users(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::ListUsersRequest)
        @grpc.list_users(request, metadata: @request_signer.sign(request))
      end
      
      def delete_user(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::DeleteUserRequest)
        @grpc.delete_user(request, metadata: @request_signer.sign(request))
      end

      def create_api_key(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::CreateApiKeyRequest)
        @grpc.create_api_key(request, metadata: @request_signer.sign(request))
      end

      def get_api_key(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::GetApiKeyRequest)
        @grpc.get_api_key(request, metadata: @request_signer.sign(request))
      end

      def list_api_keys(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::ListApiKeysRequest)
        @grpc.list_api_keys(request, metadata: @request_signer.sign(request))
      end

      def delete_api_key(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::IAM::Preview::DeleteApiKeyRequest)
        @grpc.delete_api_key(request, metadata: @request_signer.sign(request))
      end
    end
  end
  