# frozen_string_literal: true

require_relative "../test_helper"

class AlfaTest < Test::Unit::TestCase
  def setup
    @key = OpenSSL::PKey::EC.generate("prime256v1")
    @alfa = Evrblk::AuthN::Alfa.new(@key.to_pem)
    @request = Evrblk::Moab::V0::GetQueueRequest.new(queue_name: "queue1")
  end

  def test_rejects_keys_on_the_wrong_curve
    wrong_curve_key = OpenSSL::PKey::EC.generate("secp384r1")

    assert_raise(RuntimeError) do
      Evrblk::AuthN::Alfa.new(wrong_curve_key.to_pem)
    end
  end

  def test_sign_returns_a_base64_encoded_signature_verifiable_with_the_public_key
    timestamp = 1_733_240_571
    signature_base64 = @alfa.sign(@request, timestamp, "Moab", "GetQueue")

    signed_data = @alfa.send(:serialize_int64, timestamp) + "Moab" + "." + "GetQueue" +
                  @alfa.send(:marshal_protobuf, @request)

    public_key = OpenSSL::PKey::EC.new(@key.public_to_pem)
    verified = public_key.verify(
      OpenSSL::Digest.new("SHA256"),
      Base64.strict_decode64(signature_base64),
      signed_data
    )

    assert_true(verified)
  end

  def test_sign_binds_the_signature_to_the_service_and_method
    timestamp = 1_733_240_571
    signature_base64 = @alfa.sign(@request, timestamp, "Moab", "GetQueue")

    tampered_data = @alfa.send(:serialize_int64, timestamp) + "Moab" + "." + "ListQueues" +
                    @alfa.send(:marshal_protobuf, @request)

    public_key = OpenSSL::PKey::EC.new(@key.public_to_pem)
    verified = public_key.verify(
      OpenSSL::Digest.new("SHA256"),
      Base64.strict_decode64(signature_base64),
      tampered_data
    )

    assert_false(verified)
  end
end
