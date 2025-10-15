# frozen_string_literal: true

module Evrblk
  module AuthN
    class Base
      def sign(request, timestamp)
        raise "Implement me"
      end

      private

      # Serializes an Int64 value into an 8-byte big-endian
      def serialize_int64(value)
        # Ensure the value is within the 64-bit integer range
        if value < -9223372036854775808 || value > 9223372036854775807
          raise ArgumentError, "Value is outside the Int64 range"
        end

        # Pack the integer into 8 bytes with big-endian byte order
        bytes = [value].pack('q>')

        return bytes
      end

      # Marshals a protobuf object into a byte array with deterministic serialization.
      # The deterministic option ensures consistent byte representation regardless of system.
      def marshal_protobuf(obj)
        # Ensure the object is a valid protobuf message
        unless obj.is_a?(Google::Protobuf::MessageExts)
          raise ArgumentError, "Object must be a Google::Protobuf message"
        end

        # Marshal the protobuf object with deterministic serialization option
        options = { deterministic: true }

        # Encode the protobuf message to bytes
        bytes = obj.to_proto(options)

        return bytes
      end
    end
  end
end
