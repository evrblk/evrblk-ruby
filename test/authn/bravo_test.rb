# frozen_string_literal: true

require_relative "../test_helper"

class BravoTest < Test::Unit::TestCase
  def setup
    @secret = Base64.strict_encode64("super-secret-shared-key")
    @bravo = Evrblk::AuthN::Bravo.new(@secret)
    @request = Evrblk::Moab::V0::GetQueueRequest.new(queue_name: "queue1")
  end

  def test_sign_matches_an_independently_computed_hmac
    timestamp = 1_733_240_571
    signature_base64 = @bravo.sign(@request, timestamp, "Moab", "GetQueue")

    data = @bravo.send(:serialize_int64, timestamp) + "Moab" + "." + "GetQueue" +
           @bravo.send(:marshal_protobuf, @request)
    expected = OpenSSL::HMAC.digest(
      OpenSSL::Digest.new("SHA256"),
      Base64.strict_decode64(@secret),
      data
    )

    assert_equal(Base64.strict_encode64(expected), signature_base64)
  end

  def test_sign_is_deterministic
    timestamp = 1_733_240_571

    first = @bravo.sign(@request, timestamp, "Moab", "GetQueue")
    second = @bravo.sign(@request, timestamp, "Moab", "GetQueue")

    assert_equal(first, second)
  end

  def test_sign_differs_for_different_secrets
    other_bravo = Evrblk::AuthN::Bravo.new(Base64.strict_encode64("a different secret"))
    timestamp = 1_733_240_571

    signature = @bravo.sign(@request, timestamp, "Moab", "GetQueue")
    other_signature = other_bravo.sign(@request, timestamp, "Moab", "GetQueue")

    refute_equal(signature, other_signature)
  end
end
