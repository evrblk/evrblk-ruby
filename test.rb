# frozen_string_literal: true

require "evrblk"

api_key_id = "key_alfa_z141pKeFzfmGGyYlUyPsbF"
api_key_secret = <<-END
-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIN33cCNGxsuxwMaJ2jWvWcgxBSVr8HV7WUUSKGc71/BtoAoGCCqGSM49
AwEHoUQDQgAE0m8+ZVijytLp01dsupG7QF8ZpjX5UmP20wj/sluPdoHW3BgiiyCn
/pMwYptUs0yJUtUZ/0wzEyp8PgAWWhxglw==
-----END EC PRIVATE KEY-----
END

# moab_client = Evrblk::Moab::Preview::Client.new(Evrblk::AuthN::RequestSigner.new(api_key_id, api_key_secret))
#
# moab_client.create_queue(
#   name: "7sgaXAYiF7CL1I7PwsaUDjcLpKwRX5oounbJZjI2xcEJDlio6GIPDmn0zPagExSr2Ct0u0eRxSncw4Cf4JmsQbkfFVs722DqJNGG9fGUEsA2JXBi5mBbvih39p8fNhZc",
#   description: "WSO4ldIQObQKWZQ7fLZuzEX9S9NwXxjIDNaPzw3ktwE6QEASZ3Gw0HZFpgi2Ji9nvqryGbtNH2qWSsN0rrSl27xlF9HF5qnq8rokuZ8fYu2zOiCTx9U2eO3h7WQyqASQ",
#   keepalive_timeout_in_seconds: 15,
#   retry_strategy: {
#     retry_intervals_in_seconds: [1, 2, 3, 4, 5],
#   },
#   dequeuing_settings: {
#     max_inflight_tasks: 100,
#     rate_limiting: {
#       max_tokens: 1000,
#       interval: 5,
#       interval_unit: "INTERVAL_UNIT_SECONDS",
#     },
#     dequeuing_paused: false,
#   },
#   dead_letter_queue_config: {
#     enable: true,
#     max_size: 1000000,
#     retention_period_in_seconds: 86400 * 14,
#   },
#   expires_in_seconds: 86400,
# )


timestamp = 1733240571

private_pem = "-----BEGIN EC PRIVATE KEY-----\nMHcCAQEEIN33cCNGxsuxwMaJ2jWvWcgxBSVr8HV7WUUSKGc71/BtoAoGCCqGSM49\nAwEHoUQDQgAE0m8+ZVijytLp01dsupG7QF8ZpjX5UmP20wj/sluPdoHW3BgiiyCn\n/pMwYptUs0yJUtUZ/0wzEyp8PgAWWhxglw==\n-----END EC PRIVATE KEY-----"
public_pem = "-----BEGIN PUBLIC KEY-----\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE0m8+ZVijytLp01dsupG7QF8ZpjX5\nUmP20wj/sluPdoHW3BgiiyCn/pMwYptUs0yJUtUZ/0wzEyp8PgAWWhxglw==\n-----END PUBLIC KEY-----"

request = Evrblk::Moab::Preview::CreateQueueRequest.new(
  name: "7sgaXAYiF7CL1I7PwsaUDjcLpKwRX5oounbJZjI2xcEJDlio6GIPDmn0zPagExSr2Ct0u0eRxSncw4Cf4JmsQbkfFVs722DqJNGG9fGUEsA2JXBi5mBbvih39p8fNhZc",
  description: "WSO4ldIQObQKWZQ7fLZuzEX9S9NwXxjIDNaPzw3ktwE6QEASZ3Gw0HZFpgi2Ji9nvqryGbtNH2qWSsN0rrSl27xlF9HF5qnq8rokuZ8fYu2zOiCTx9U2eO3h7WQyqASQ",
  keepalive_timeout_in_seconds: 15,
  retry_strategy: Evrblk::Moab::Preview::RetryStrategy.new(
    retry_intervals_in_seconds: [1, 2, 3, 4, 5],
  ),
  dequeuing_settings: Evrblk::Moab::Preview::DequeuingSettings.new(
    max_in_progress_tasks: 100,
    rate_limiting: Evrblk::Moab::Preview::TokenBucketRateLimiting.new(
      max_tokens: 1000,
      interval: 5,
      interval_unit: Evrblk::Moab::Preview::IntervalUnit::INTERVAL_UNIT_SECONDS,
    ),
    dequeuing_paused: false,
  ),
  dead_letter_queue_config: Evrblk::Moab::Preview::DeadLetterQueueConfig.new(
    enable: true,
    max_size: 1000000,
    retention_period_in_seconds: 86400 * 14,
  ),
  expires_in_seconds: 86400,
)

alfa = Evrblk::AuthN::Alfa.new(private_pem)

# Unfortunately we cannot assert that actual signature is equal to some expected value since ECDSA signatures are
# randomized. Here we only check that it was successfully signed.
signature = alfa.sign(request, timestamp)
puts(signature)
