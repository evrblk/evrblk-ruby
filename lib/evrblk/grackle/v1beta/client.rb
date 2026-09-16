# frozen_string_literal: true

module Evrblk::Grackle::V1Beta
  class Client
    def initialize(request_signer, endpoint)
      @grpc = Evrblk::Grackle::V1Beta::GrackleApi::Stub.new(endpoint, :this_channel_is_insecure)
      @request_signer = request_signer
    end

    def create_namespace(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CreateNamespaceRequest)
      @grpc.create_namespace(request, metadata: @request_signer.sign(request, "Grackle", "CreateNamespace"))
    end

    def list_namespaces(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListNamespacesRequest)
      @grpc.list_namespaces(request, metadata: @request_signer.sign(request, "Grackle", "ListNamespaces"))
    end

    def get_namespace(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetNamespaceRequest)
      @grpc.get_namespace(request, metadata: @request_signer.sign(request, "Grackle", "GetNamespace"))
    end

    def delete_namespace(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::DeleteNamespaceRequest)
      @grpc.delete_namespace(request, metadata: @request_signer.sign(request, "Grackle", "DeleteNamespace"))
    end

    def update_namespace(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::UpdateNamespaceRequest)
      @grpc.update_namespace(request, metadata: @request_signer.sign(request, "Grackle", "UpdateNamespace"))
    end

    def list_semaphore_holders(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListSemaphoreHoldersRequest)
      @grpc.list_semaphore_holders(request, metadata: @request_signer.sign(request, "Grackle", "ListSemaphoreHolders"))
    end

    def create_semaphore_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CreateSemaphoreLeaseRequest)
      @grpc.create_semaphore_lease(request, metadata: @request_signer.sign(request, "Grackle", "CreateSemaphoreLease"))
    end

    def revoke_semaphore_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::RevokeSemaphoreLeaseRequest)
      @grpc.revoke_semaphore_lease(request, metadata: @request_signer.sign(request, "Grackle", "RevokeSemaphoreLease"))
    end

    def refresh_semaphore_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::RefreshSemaphoreLeaseRequest)
      @grpc.refresh_semaphore_lease(request, metadata: @request_signer.sign(request, "Grackle", "RefreshSemaphoreLease"))
    end

    def list_semaphore_leases(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListSemaphoreLeasesRequest)
      @grpc.list_semaphore_leases(request, metadata: @request_signer.sign(request, "Grackle", "ListSemaphoreLeases"))
    end

    def get_semaphore_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetSemaphoreLeaseRequest)
      @grpc.get_semaphore_lease(request, metadata: @request_signer.sign(request, "Grackle", "GetSemaphoreLease"))
    end

    def create_semaphore(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CreateSemaphoreRequest)
      @grpc.create_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "CreateSemaphore"))
    end

    def list_semaphores(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListSemaphoresRequest)
      @grpc.list_semaphores(request, metadata: @request_signer.sign(request, "Grackle", "ListSemaphores"))
    end

    def get_semaphore(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetSemaphoreRequest)
      @grpc.get_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "GetSemaphore"))
    end

    def acquire_semaphore(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::AcquireSemaphoreRequest)
      @grpc.acquire_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "AcquireSemaphore"))
    end

    def release_semaphore(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ReleaseSemaphoreRequest)
      @grpc.release_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "ReleaseSemaphore"))
    end

    def update_semaphore(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::UpdateSemaphoreRequest)
      @grpc.update_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "UpdateSemaphore"))
    end

    def delete_semaphore(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::DeleteSemaphoreRequest)
      @grpc.delete_semaphore(request, metadata: @request_signer.sign(request, "Grackle", "DeleteSemaphore"))
    end

    def update_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::UpdateWaitGroupRequest)
      @grpc.update_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "UpdateWaitGroup"))
    end

    def list_wait_group_completed_jobs(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListWaitGroupCompletedJobsRequest)
      @grpc.list_wait_group_completed_jobs(request, metadata: @request_signer.sign(request, "Grackle", "ListWaitGroupCompletedJobs"))
    end

    def wait_for_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::WaitForWaitGroupRequest)
      @grpc.wait_for_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "WaitForWaitGroup"))
    end

    def create_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CreateWaitGroupRequest)
      @grpc.create_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "CreateWaitGroup"))
    end

    def list_wait_groups(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListWaitGroupsRequest)
      @grpc.list_wait_groups(request, metadata: @request_signer.sign(request, "Grackle", "ListWaitGroups"))
    end

    def get_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetWaitGroupRequest)
      @grpc.get_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "GetWaitGroup"))
    end

    def delete_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::DeleteWaitGroupRequest)
      @grpc.delete_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "DeleteWaitGroup"))
    end

    def add_jobs_to_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::AddJobsToWaitGroupRequest)
      @grpc.add_jobs_to_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "AddJobsToWaitGroup"))
    end

    def complete_jobs_from_wait_group(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CompleteJobsFromWaitGroupRequest)
      @grpc.complete_jobs_from_wait_group(request, metadata: @request_signer.sign(request, "Grackle", "CompleteJobsFromWaitGroup"))
    end

    def acquire_lock(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::AcquireLockRequest)
      @grpc.acquire_lock(request, metadata: @request_signer.sign(request, "Grackle", "AcquireLock"))
    end

    def release_lock(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ReleaseLockRequest)
      @grpc.release_lock(request, metadata: @request_signer.sign(request, "Grackle", "ReleaseLock"))
    end

    def get_lock(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetLockRequest)
      @grpc.get_lock(request, metadata: @request_signer.sign(request, "Grackle", "GetLock"))
    end

    def delete_lock(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::DeleteLockRequest)
      @grpc.delete_lock(request, metadata: @request_signer.sign(request, "Grackle", "DeleteLock"))
    end

    def list_locks(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListLocksRequest)
      @grpc.list_locks(request, metadata: @request_signer.sign(request, "Grackle", "ListLocks"))
    end

    def create_lock_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CreateLockLeaseRequest)
      @grpc.create_lock_lease(request, metadata: @request_signer.sign(request, "Grackle", "CreateLockLease"))
    end

    def revoke_lock_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::RevokeLockLeaseRequest)
      @grpc.revoke_lock_lease(request, metadata: @request_signer.sign(request, "Grackle", "RevokeLockLease"))
    end

    def refresh_lock_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::RefreshLockLeaseRequest)
      @grpc.refresh_lock_lease(request, metadata: @request_signer.sign(request, "Grackle", "RefreshLockLease"))
    end

    def list_lock_leases(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListLockLeasesRequest)
      @grpc.list_lock_leases(request, metadata: @request_signer.sign(request, "Grackle", "ListLockLeases"))
    end

    def get_lock_lease(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetLockLeaseRequest)
      @grpc.get_lock_lease(request, metadata: @request_signer.sign(request, "Grackle", "GetLockLease"))
    end

    def create_barrier(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::CreateBarrierRequest)
      @grpc.create_barrier(request, metadata: @request_signer.sign(request, "Grackle", "CreateBarrier"))
    end

    def list_barriers(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListBarriersRequest)
      @grpc.list_barriers(request, metadata: @request_signer.sign(request, "Grackle", "ListBarriers"))
    end

    def get_barrier(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::GetBarrierRequest)
      @grpc.get_barrier(request, metadata: @request_signer.sign(request, "Grackle", "GetBarrier"))
    end

    def delete_barrier(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::DeleteBarrierRequest)
      @grpc.delete_barrier(request, metadata: @request_signer.sign(request, "Grackle", "DeleteBarrier"))
    end

    def update_barrier(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::UpdateBarrierRequest)
      @grpc.update_barrier(request, metadata: @request_signer.sign(request, "Grackle", "UpdateBarrier"))
    end

    def arrive_at_barrier(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ArriveAtBarrierRequest)
      @grpc.arrive_at_barrier(request, metadata: @request_signer.sign(request, "Grackle", "ArriveAtBarrier"))
    end

    def wait_at_barrier(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::WaitAtBarrierRequest)
      @grpc.wait_at_barrier(request, metadata: @request_signer.sign(request, "Grackle", "WaitAtBarrier"))
    end

    def list_barrier_participants(request_hash)
      request = Evrblk::HashConverter.hash_to_grpc_message(request_hash, Evrblk::Grackle::V1Beta::ListBarrierParticipantsRequest)
      @grpc.list_barrier_participants(request, metadata: @request_signer.sign(request, "Grackle", "ListBarrierParticipants"))
    end
  end
end
