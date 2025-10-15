# frozen_string_literal: true

module Evrblk::Moab::Preview
  class Client
    def initialize(request_signer, endpoint)
      @grpc = Evrblk::Moab::Preview::MoabPreviewApi::Stub.new(endpoint, :this_channel_is_insecure)
      @request_signer = request_signer
    end
  
    def create_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::CreateQueueRequest)
      @grpc.create_queue(request, metadata: @request_signer.sign(request))
    end
  
    def get_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::GetQueueRequest)
      @grpc.get_queue(request, metadata: @request_signer.sign(request))
    end

    def update_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::UpdateQueueRequest)
      @grpc.update_queue(request, metadata: @request_signer.sign(request))
    end

    def delete_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::DeleteQueueRequest)
      @grpc.delete_queue(request, metadata: @request_signer.sign(request))
    end

    def list_queues(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::ListQueuesRequest)
      @grpc.list_queues(request, metadata: @request_signer.sign(request))
    end

    def get_task(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::GetTaskRequest)
      @grpc.get_task(request, metadata: @request_signer.sign(request))
    end

    def enqueue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::EnqueueRequest)
      @grpc.enqueue(request, metadata: @request_signer.sign(request))
    end

    def dequeue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::DequeueRequest)
      @grpc.dequeue(request, metadata: @request_signer.sign(request))
    end

    def report_status(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::ReportStatusRequest)
      @grpc.report_status(request, metadata: @request_signer.sign(request))
    end

    def delete_tasks(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::DeleteTasksRequest)
      @grpc.delete_tasks(request, metadata: @request_signer.sign(request))
    end

    def restart_tasks(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::RestartTasksRequest)
      @grpc.restart_tasks(request, metadata: @request_signer.sign(request))
    end

    def purge_queue(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::PurgeQueueRequest)
      @grpc.purge_queue(request, metadata: @request_signer.sign(request))
    end

    def create_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::CreateScheduleRequest)
      @grpc.create_schedule(request, metadata: @request_signer.sign(request))
    end

    def get_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::GetScheduleRequest)
      @grpc.get_schedule(request, metadata: @request_signer.sign(request))
    end

    def update_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::UpdateScheduleRequest)
      @grpc.update_schedule(request, metadata: @request_signer.sign(request))
    end

    def delete_schedule(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Moab::Preview::DeleteScheduleRequest)
      @grpc.delete_schedule(request, metadata: @request_signer.sign(request))
    end
  end
end
