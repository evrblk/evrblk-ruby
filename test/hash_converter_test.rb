# frozen_string_literal: true

require_relative "test_helper"

class HashConverterTest < Test::Unit::TestCase
  def test_converts_scalar_fields
    message = Evrblk::HashConverter.hash_to_grpc_message(
      { name: "queue1", keepalive_timeout_in_seconds: 15 },
      Evrblk::Moab::V0::CreateQueueRequest
    )

    assert_equal("queue1", message.name)
    assert_equal(15, message.keepalive_timeout_in_seconds)
  end

  def test_omits_absent_keys_and_leaves_field_defaults
    message = Evrblk::HashConverter.hash_to_grpc_message(
      { name: "queue1" },
      Evrblk::Moab::V0::CreateQueueRequest
    )

    assert_equal("", message.description)
    assert_equal(0, message.keepalive_timeout_in_seconds)
  end

  def test_converts_nested_message_field
    message = Evrblk::HashConverter.hash_to_grpc_message(
      { name: "queue1", retry_strategy: { retry_intervals_in_seconds: [1, 2, 3] } },
      Evrblk::Moab::V0::CreateQueueRequest
    )

    assert_instance_of(Evrblk::Moab::V0::RetryStrategy, message.retry_strategy)
    assert_equal([1, 2, 3], message.retry_strategy.retry_intervals_in_seconds.to_a)
  end

  def test_converts_deeply_nested_message_fields
    message = Evrblk::HashConverter.hash_to_grpc_message(
      {
        name: "queue1",
        dequeuing_settings: {
          max_in_progress_tasks: 100,
          rate_limiting: {
            max_tokens: 1000,
            interval: 5,
            interval_unit: Evrblk::Moab::V0::IntervalUnit::INTERVAL_UNIT_SECONDS
          }
        }
      },
      Evrblk::Moab::V0::CreateQueueRequest
    )

    assert_equal(100, message.dequeuing_settings.max_in_progress_tasks)
    assert_equal(1000, message.dequeuing_settings.rate_limiting.max_tokens)
    assert_equal(:INTERVAL_UNIT_SECONDS, message.dequeuing_settings.rate_limiting.interval_unit)
  end

  def test_converts_repeated_message_field
    message = Evrblk::HashConverter.hash_to_grpc_message(
      {
        queue_name: "queue1",
        entries: [
          { payload: "one" },
          { payload: "two" }
        ]
      },
      Evrblk::Moab::V0::EnqueueRequest
    )

    assert_equal(2, message.entries.length)
    assert_equal("one", message.entries[0].payload)
    assert_equal("two", message.entries[1].payload)
  end

  def test_converts_map_field
    message = Evrblk::HashConverter.hash_to_grpc_message(
      { name: "ns1", metadata: { "env" => "prod", "team" => "platform" } },
      Evrblk::Grackle::V1Beta::CreateNamespaceRequest
    )

    assert_equal("prod", message.metadata["env"])
    assert_equal("platform", message.metadata["team"])
  end

  def test_does_not_mutate_the_source_hash
    source = { name: "queue1", retry_strategy: { retry_intervals_in_seconds: [1, 2] } }

    Evrblk::HashConverter.hash_to_grpc_message(source, Evrblk::Moab::V0::CreateQueueRequest)

    assert_equal({ name: "queue1", retry_strategy: { retry_intervals_in_seconds: [1, 2] } }, source)
  end

  def test_private_helpers_are_not_part_of_the_public_api
    refute_respond_to(Evrblk::HashConverter, :serialize_with_descriptor)
    refute_respond_to(Evrblk::HashConverter, :serialize_with_field_descriptor)
    refute_respond_to(Evrblk::HashConverter, :serialize_with_repeated_field)
  end
end
