# frozen_string_literal: true

module Evrblk::Moab::V0
  class Client
    def initialize(request_signer, endpoint)
      @g= Evrblk::Moab::V0::MoabApi::Stub.new(endpoint, :this_channel_is_insecure)
      @request_signer = request_signer
    end

    def create_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::CreateQueueRequest)
      @grpc.create_queue(request, metadata: @request_signer.sign(request, "Moab", "CreateQueue"))
    end

    def get_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::GetQueueRequest)
      @grpc.get_queue(request, metadata: @request_signer.sign(request, "Moab", "GetQueue"))
    end

    def update_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::UpdateQueueRequest)
      @grpc.update_queue(request, metadata: @request_signer.sign(request, "Moab", "UpdateQueue"))
    end

    def delete_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::DeleteQueueRequest)
      @grpc.delete_queue(request, metadata: @request_signer.sign(request, "Moab", "DeleteQueue"))
    end

    def list_queues(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::ListQueuesRequest)
      @grpc.list_queues(request, metadata: @request_signer.sign(request, "Moab", "ListQueues"))
    end

    def get_task(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::GetTaskRequest)
      @grpc.get_task(request, metadata: @request_signer.sign(request, "Moab", "GetTask"))
    end

    def list_tasks(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::ListTasksRequest)
      @grpc.list_tasks(request, metadata: @request_signer.sign(request, "Moab", "ListTasks"))
    end

    def enqueue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::EnqueueRequest)
      @grpc.enqueue(request, metadata: @request_signer.sign(request, "Moab", "Enqueue"))
    end

    def dequeue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::DequeueRequest)
      @grpc.dequeue(request, metadata: @request_signer.sign(request, "Moab", "Dequeue"))
    end

    def report_status(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::ReportStatusRequest)
      @grpc.report_status(request, metadata: @request_signer.sign(request, "Moab", "ReportStatus"))
    end

    def delete_tasks(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::DeleteTasksRequest)
      @grpc.delete_tasks(request, metadata: @request_signer.sign(request, "Moab", "DeleteTasks"))
    end

    def restart_tasks(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::RestartTasksRequest)
      @grpc.restart_tasks(request, metadata: @request_signer.sign(request, "Moab", "RestartTasks"))
    end

    def purge_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::PurgeQueueRequest)
      @grpc.purge_queue(request, metadata: @request_signer.sign(request, "Moab", "PurgeQueue"))
    end

    def create_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::CreateScheduleRequest)
      @grpc.create_schedule(request, metadata: @request_signer.sign(request, "Moab", "CreateSchedule"))
    end

    def get_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::GetScheduleRequest)
      @grpc.get_schedule(request, metadata: @request_signer.sign(request, "Moab", "GetSchedule"))
    end

    def update_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::UpdateScheduleRequest)
      @grpc.update_schedule(request, metadata: @request_signer.sign(request, "Moab", "UpdateSchedule"))
    end

    def delete_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::DeleteScheduleRequest)
      @grpc.delete_schedule(request, metadata: @request_signer.sign(request, "Moab", "DeleteSchedule"))
    end

    def list_schedules(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::V0::ListSchedulesRequest)
      @grpc.list_schedules(request, metadata: @request_signer.sign(request, "Moab", "ListSchedules"))
    end
  end
end
