# frozen_string_literal: true

module Evrblk
  module AuthN
    class RequestSigner
      def initialize(api_key_id, api_key_secret)
        unless api_key_id.match?(/key_(alfa|bravo)_[0-9a-zA-Z]+/)
          raise ArgumentError,
                "Invalid API Key ID #{api_key_id}"
        end

        @api_key_id = api_key_id

        @signer = if api_key_id.start_with?("key_alfa")
                    Evrblk::AuthN::Alfa.new(api_key_secret)
                  else
                    Evrblk::AuthN::Bravo.new(api_key_secret)
                  end
      end

      def sign(request, service, method)
        # Take current time
        timestamp = Time.now.to_i

        # Sign the request body with the timestamp
        signature = @signer.sign(request, timestamp, service, method)

        # Return gRPC headers for authentication
        {
          "evrblk-signature": signature,
          "evrblk-api-key-id": @api_key_id,
          "evrblk-timestamp": timestamp.to_s
        }
      end
    end

    class NoOpSigner
      def sign(_request, _service = nil, _method = nil)
        {}
      end
    end
  end
end
