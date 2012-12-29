## Run the application

Start the application on `http://0.0.0.0:5005`.

```shell
$ bundle install
$ bundle exec shotgun --port 5005 --host 0.0.0.0
```

## Add URLs to your talk

```shell
$ bundle exec rake console
>> talk = Talk.all.select { |t| t.title =~ /RSpec/ }.first
talk.code_url = "https://github.com/remiprev/introduction-a-rspec"
talk.slides_url = "http://speakerdeck.com/remi/introduction-a-rspec"
talk.save
```
