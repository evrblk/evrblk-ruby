# frozen_string_literal: true

module Evrblk
  class HashConverter
    def self.hash_to_grpc_message(source_hash, message_class)
      serialize_with_descriptor(message_class.descriptor, source_hash.dup)
    end

    private

    def self.serialize_with_descriptor(descriptor_class, hash_value)
      return hash_value if descriptor_class.nil?

      new_hash = {}
      available_keys = hash_value.keys
      descriptor_class.entries.each do |entry|
        is_key_present = available_keys.include?(entry.name.to_sym)
        value = serialize_with_field_descriptor(entry, hash_value[entry.name.to_sym], is_key_present: is_key_present)
        unless value.nil?
          new_hash[entry.name] = value
        end
      end

      descriptor_class.msgclass.new(new_hash)
    end

    def self.serialize_with_field_descriptor(field_descriptor, value, is_key_present: true)
      return value if field_descriptor.nil?

      if field_descriptor.label == :repeated
        return serialize_with_repeated_field(field_descriptor, value)
      end
      if field_descriptor.type == :message
        if field_descriptor.subtype.is_a?(Google::Protobuf::Descriptor)
          return serialize_with_descriptor(field_descriptor.subtype, value) unless value.nil?
        end

        return field_descriptor.subtype.msgclass.new(value) unless value.nil?

      end
      value
    end

    def self.serialize_with_repeated_field(field_descriptor, value)
      if field_descriptor.label == :repeated
        if field_descriptor.subtype && field_descriptor.subtype.lookup("key")
          if field_descriptor.subtype.lookup("value")
            value_dup = ({})
            org_value = value || {}
            org_value.keys.each do |k|
              value_dup[k.to_s] = (serialize_with_field_descriptor(field_descriptor.subtype.lookup("value"), org_value[k]))
            end
            return value_dup
          else
            return value
          end
        end
        return (value || []).map  { |v| serialize_with_descriptor(field_descriptor.subtype, v) }
      end
    end
  end
end
