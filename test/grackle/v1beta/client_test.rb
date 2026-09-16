# frozen_string_literal: true

require_relative "../../test_helper"

class GrackleClientTest < Test::Unit::TestCase
  def setup
    @signer = Evrblk::AuthN::NoOpSigner.new
    @client = Evrblk::Grackle::V1Beta::Client.new(@signer, "localhost:0")
  end

  def test_initializes_a_grpc_stub
    assert_instance_of(Evrblk::Grackle::V1Beta::GrackleApi::Stub, @client.instance_variable_get(:@grpc))
  end

  def test_create_namespace_delegates_to_the_grpc_stub_with_a_converted_request_and_signed_metadata
    captured = nil
    fake_grpc = Object.new
    fake_grpc.define_singleton_method(:create_namespace) do |request, metadata:|
      captured = [request, metadata]
    end
    @client.instance_variable_set(:@grpc, fake_grpc)

    @client.create_namespace(name: "namespace1")

    request, metadata = captured
    assert_instance_of(Evrblk::Grackle::V1Beta::CreateNamespaceRequest, request)
    assert_equal("namespace1", request.name)
    assert_equal({}, metadata)
  end

  def test_acquire_lock_delegates_to_the_grpc_stub
    captured = nil
    fake_grpc = Object.new
    fake_grpc.define_singleton_method(:acquire_lock) do |request, metadata:|
      captured = [request, metadata]
    end
    @client.instance_variable_set(:@grpc, fake_grpc)

    @client.acquire_lock(namespace_name: "namespace1", lock_name: "lock1", lease_id: "lease1")

    request, = captured
    assert_instance_of(Evrblk::Grackle::V1Beta::AcquireLockRequest, request)
    assert_equal("namespace1", request.namespace_name)
    assert_equal("lock1", request.lock_name)
  end
end
