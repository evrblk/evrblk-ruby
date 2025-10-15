# frozen_string_literal: true

require 'openssl'
require 'base64'

module Evrblk
  module AuthN
    class Alfa < Base
      def initialize(private_key_pem)
        # Parse the PEM-encoded private key
        @private_key = OpenSSL::PKey::EC.new(private_key_pem)

        # Verify that the private key is using the correct curve
        unless @private_key.group.curve_name == 'prime256v1'
          raise "Invalid key: Expected secp256r1 (prime256v1) but got #{@private_key.group.curve_name}"
        end
      end

      def sign(request, timestamp)
        # Serialize timestamp and request body
        data = serialize_int64(timestamp) + marshal_protobuf(request)

        # Sign a digest using SHA-256 with the private key
        signature = @private_key.sign(OpenSSL::Digest::SHA256.new, data)

        # Convert the signature to Base64
        signature_base64 = Base64.strict_encode64(signature)

        return signature_base64
      end
    end
  end
end
