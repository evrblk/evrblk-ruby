# frozen_string_literal: true

module Evrblk
  module AuthN
    class Base
      def sign(_request, _timestamp)
        raise "Implement me"
      end

      private

      # Serializes an Int64 value into an 8-byte big-endian
      def serialize_int64(value)
        # Ensure the value is within the 64-bit integer range
        if value < -9_223_372_036_854_775_808 || value > 9_223_372_036_854_775_807
          raise ArgumentError, "Value is outside the Int64 range"
        end

        # Pack the integer into 8 bytes with big-endian byte order
        [value].pack("q>")
      end

      # Marshals a protobuf object into a byte array with deterministic serialization.
      # The deterministic option ensures consistent byte representation regardless of system.
      def marshal_protobuf(obj)
        # Ensure the object is a valid protobuf message
        raise ArgumentError, "Object must be a Google::Protobuf message" unless obj.is_a?(Google::Protobuf::MessageExts)

        # Marshal the protobuf object with deterministic serialization option
        options = { deterministic: true }

        # Encode the protobuf message to bytes
        obj.to_proto(options)
      end
    end
  end
end
