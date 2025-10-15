# frozen_string_literal: true

module Evrblk::MyAccount::Preview
    class Client
      def initialize(request_signer, endpoint)
        @grpc = Evrblk::MyAccount::Preview::MyAccountPreviewApi::Stub.new(endpoint, :this_channel_is_insecure)
        @request_signer = request_signer
      end
    
      def get_account(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::MyAccount::Preview::GetAccountRequest)
        @grpc.get_account(request, metadata: @request_signer.sign(request))
      end

    end
  end
  