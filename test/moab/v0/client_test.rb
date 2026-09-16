# frozen_string_literal: true

require_relative "../../test_helper"

class MoabClientTest < Test::Unit::TestCase
  def setup
    @signer = Evrblk::AuthN::NoOpSigner.new
    @client = Evrblk::Moab::V0::Client.new(@signer, "localhost:0")
  end

  def test_initializes_a_grpc_stub
    assert_instance_of(Evrblk::Moab::V0::MoabApi::Stub, @client.instance_variable_get(:@grpc))
  end

  def test_create_queue_delegates_to_the_grpc_stub_with_a_converted_request_and_signed_metadata
    captured = nil
    fake_grpc = Object.new
    fake_grpc.define_singleton_method(:create_queue) do |request, metadata:|
      captured = [request, metadata]
    end
    @client.instance_variable_set(:@grpc, fake_grpc)

    @client.create_queue(name: "queue1", keepalive_timeout_in_seconds: 15)

    request, metadata = captured
    assert_instance_of(Evrblk::Moab::V0::CreateQueueRequest, request)
    assert_equal("queue1", request.name)
    assert_equal({}, metadata)
  end

  def test_get_task_delegates_to_the_grpc_stub
    captured = nil
    fake_grpc = Object.new
    fake_grpc.define_singleton_method(:get_task) do |request, metadata:|
      captured = [request, metadata]
    end
    @client.instance_variable_set(:@grpc, fake_grpc)

    @client.get_task(queue_name: "queue1", task_id: "task1")

    request, = captured
    assert_instance_of(Evrblk::Moab::V0::GetTaskRequest, request)
    assert_equal("queue1", request.queue_name)
    assert_equal("task1", request.task_id)
  end
end
