# Everblack Ruby SDK

## Installing

```
gem install evrblk
```

## Example

```ruby
api_key_id = "key_alfa_z141pKeFzfmGGyYlUyPsbF"
api_key_secret = <<-END
-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIN33cCNGxsuxwMaJ2jWvWcgxBSVr8HV7WUUSKGc71/BtoAoGCCqGSM49
AwEHoUQDQgAE0m8+ZVijytLp01dsupG7QF8ZpjX5UmP20wj/sluPdoHW3BgiiyCn
/pMwYptUs0yJUtUZ/0wzEyp8PgAWWhxglw==
-----END EC PRIVATE KEY-----
END

grackle_client = Evrblk::Grackle::Preview::Client.new(Evrblk::AuthN::RequestSigner.new(api_key_id, api_key_secret))

grackle_client.create_namespace(
    name: "mynamespace"
)

now = Time.now
grackle_client.acquire_lock(
    namespace_name: "mynamespace",
    lock_name: "lock1",
    process_id: "process1",
    expires_at: (now.to_i + 60*5) * (10 ** 9) + now.nsec # expires in 5 min
)

```

## License

Everblack Ruby SDK is released under the [MIT License](https://opensource.org/licenses/MIT).
