# frozen_string_literal: true

module Evrblk::Grackle::Preview
    class Client
      def initialize(request_signer, endpoint)
        @grpc = Evrblk::Grackle::Preview::GracklePreviewApi::Stub.new(endpoint, :this_channel_is_insecure)
        @request_signer = request_signer
      end
    
      def create_namespace(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::CreateNamespaceRequest)
        @grpc.create_namespace(request, metadata: @request_signer.sign(request, "Grackle", "CreateNamespace"))
      end

      def list_namespaces(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::ListNamespacesRequest)
        @grpc.list_namespaces(request, metadata: @request_signer.sign(request, "Grackle", "ListNamespaces"))
      end

      def get_namespace(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::GetNamespaceRequest)
        @grpc.get_namespace(request, metadata: @request_signer.sign(request, "Grackle", "GetNamespace"))
      end

      def delete_namespace(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::DeleteNamespaceRequest)
        @grpc.delete_namespace(request, metadata: @request_signer.sign(request, "Grackle", "DeleteNamespace"))
      end

      def update_namespace(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::UpdateNamespaceRequest)
        @grpc.update_namespace(request, metadata: @request_signer.sign(request, "Grackle", "UpdateNamespace"))
      end

      def create_semaphore(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::CreateSemaphoreRequest)
        @grpc.create_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "CreateSemaphore"))
      end

      def list_semaphores(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::ListSemaphoresRequest)
        @grpc.list_semaphores(request, metadata: @request_signer.sign(request, "Grackle", "ListSemaphores"))
      end

      def get_semaphore(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::GetSemaphoreRequest)
        @grpc.get_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "GetSemaphore"))
      end

      def acquire_semaphore(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::AcquireSemaphoreRequest)
        @grpc.acquire_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "AcquireSemaphore"))
      end

      def release_semaphore(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::ReleaseSemaphoreRequest)
        @grpc.release_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "ReleaseSemaphore"))
      end

      def update_semaphore(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::UpdateSemaphoreRequest)
        @grpc.update_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "UpdateSemaphore"))
      end

      def delete_semaphore(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::DeleteSemaphoreRequest)
        @grpc.delete_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "DeleteSemaphore"))
      end

      def create_wait_group(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::CreateWaitGroupRequest)
        @grpc.create_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "CreateWaitGroup"))
      end

      def list_wait_groups(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::ListWaitGroupsRequest)
        @grpc.list_wait_groups(request, metadata: @request_signer.sign(request, "Grackle", "ListWaitGroups"))
      end

      def get_wait_group(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::GetWaitGroupRequest)
        @grpc.get_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "GetWaitGroup"))
      end

      def delete_wait_group(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::DeleteWaitGroupRequest)
        @grpc.delete_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "DeleteWaitGroup"))
      end

      def add_jobs_to_wait_group(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::AddJobsToWaitGroupRequest)
        @grpc.add_jobs_to_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "AddJobsToWaitGroup"))
      end

      def complete_jobs_from_wait_group(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::CompleteJobsFromWaitGroupRequest)
        @grpc.complete_jobs_from_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "CompleteJobsFromWaitGroup"))
      end

      def acquire_lock(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::AcquireLockRequest)
        @grpc.acquire_lock(request, metadata: @request_signer.sign(request, "Grackle", "AcquireLock"))
      end

      def release_lock(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::ReleaseLockRequest)
        @grpc.release_lock(request, metadata: @request_signer.sign(request, "Grackle", "ReleaseLock"))
      end

      def get_lock(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::GetLockRequest)
        @grpc.get_lock(request, metadata: @request_signer.sign(request, "Grackle", "GetLock"))
      end

      def delete_lock(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::DeleteLockRequest)
        @grpc.delete_lock(request, metadata: @request_signer.sign(request, "Grackle", "DeleteLock"))
      end

      def list_locks(request_hash)
        request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::Preview::ListLocksRequest)
        @grpc.list_locks(request, metadata: @request_signer.sign(request, "Grackle", "ListLocks"))
      end  
    end
  end
  