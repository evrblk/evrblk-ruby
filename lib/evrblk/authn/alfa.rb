# frozen_string_literal: true

require "openssl"
require "base64"

module Evrblk
  module AuthN
    class Alfa < Base
      def initialize(private_key_pem)
        super()

        # Parse the PEM-encoded private key
        @private_key = OpenSSL::PKey::EC.new(private_key_pem)

        # Verify that the private key is using the correct curve
        return if @private_key.group.curve_name == "prime256v1"

        raise "Invalid key: Expected secp256r1 (prime256v1) but got #{@private_key.group.curve_name}"
      end

      def sign(request, timestamp, service, method)
        # Serialize timestamp and request body
        data = serialize_int64(timestamp) + service + "." + method + marshal_protobuf(request)

        # Sign a digest using SHA-256 with the private key
        signature = @private_key.sign(OpenSSL::Digest.new("SHA256"), data)

        # Convert the signature to Base64
        Base64.strict_encode64(signature)
      end
    end
  end
end
