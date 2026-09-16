# frozen_string_literal: true

require_relative "../test_helper"

class RequestSignerTest < Test::Unit::TestCase
  def test_rejects_malformed_api_key_ids
    assert_raise(ArgumentError) do
      Evrblk::AuthN::RequestSigner.new("not-a-valid-key-id", "secret")
    end
  end

  def test_uses_alfa_signer_for_alfa_key_ids
    key = OpenSSL::PKey::EC.generate("prime256v1")
    signer = Evrblk::AuthN::RequestSigner.new("key_alfa_abc123", key.to_pem)

    assert_instance_of(Evrblk::AuthN::Alfa, signer.instance_variable_get(:@signer))
  end

  def test_uses_bravo_signer_for_bravo_key_ids
    signer = Evrblk::AuthN::RequestSigner.new("key_bravo_abc123", Base64.strict_encode64("secret"))

    assert_instance_of(Evrblk::AuthN::Bravo, signer.instance_variable_get(:@signer))
  end

  def test_sign_returns_the_expected_grpc_metadata_headers
    key = OpenSSL::PKey::EC.generate("prime256v1")
    signer = Evrblk::AuthN::RequestSigner.new("key_alfa_abc123", key.to_pem)
    request = Evrblk::Moab::V0::GetQueueRequest.new(queue_name: "queue1")

    headers = signer.sign(request, "Moab", "GetQueue")

    assert_equal(%i[evrblk-signature evrblk-api-key-id evrblk-timestamp].sort, headers.keys.sort)
    assert_equal("key_alfa_abc123", headers[:"evrblk-api-key-id"])
    assert_match(/\A\d+\z/, headers[:"evrblk-timestamp"])
  end

  def test_no_op_signer_returns_no_headers
    signer = Evrblk::AuthN::NoOpSigner.new

    assert_equal({}, signer.sign(nil))
  end
end
