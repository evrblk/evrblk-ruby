# Everblack Ruby SDK

## Installing

```
gem install evrblk
```

## Example

```ruby
require "evrblk"

api_key_id = "key_alfa_z141pKeFzfmGGyYlUyPsbF"
api_key_secret = <<-END
-----BEGIN EC PRIVATE KEY-----
SoME=reAl=PriVaTE=keY
-----END EC PRIVATE KEY-----
END

signer = Evrblk::AuthN::RequestSigner.new(api_key_id, api_key_secret)
grackle_client = Evrblk::Grackle::V1Beta::Client.new(signer, "localhost:8000")

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
