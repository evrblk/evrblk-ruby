# frozen_string_literal: true

require "openssl"
require "base64"

module Evrblk
  module AuthN
    class Bravo < Base
      def initialize(secret_base64)
        super()

        @secret = Base64.strict_decode64(secret_base64)
      end

      def sign(request, timestamp, service, method)
        # Serialize timestamp and request body
        data = serialize_int64(timestamp) + service + "." + method + marshal_protobuf(request)

        # Sign a digest using HMAC-SHA256 with the shared secret
        signature = OpenSSL::HMAC.digest(OpenSSL::Digest.new("SHA256"), @secret, data)

        # Convert the signature to Base64
        Base64.strict_encode64(signature)
      end
    end
  end
end
