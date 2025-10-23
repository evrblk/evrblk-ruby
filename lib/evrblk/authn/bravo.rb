# frozen_string_literal: true

require 'base64'

module Evrblk
  module AuthN
    class Bravo < Base
      def initialize(secret_base64)

      end

      def sign(request, timestamp, service, method)
        # Serialize timestamp and request body
        data = serialize_int64(timestamp) + service + "." + method + marshal_protobuf(request)

        # Sign a digest using SHA-256 with the private key
        signature = @private_key.sign(OpenSSL::Digest::SHA256.new, data)

        # Convert the signature to Base64
        signature_base64 = Base64.strict_encode64(signature)

        return signature_base64
      end
    end
  end
end
