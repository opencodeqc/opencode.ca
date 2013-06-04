# opencode.ca

This is the source code that runs on <http://opencode.ca>.

## Run the application

```shell
$ bundle install
$ cp .env.default .env
$ foreman start
08:06:56 web.1  | I, [2013-02-25T08:06:56.476145 #59550]  INFO -- : Refreshing Gem list
08:06:57 web.1  | I, [2013-02-25T08:06:57.489849 #59550]  INFO -- : listening on addr=0.0.0.0:5005 fd=11
08:06:58 web.1  | I, [2013-02-25T08:06:58.507881 #59550]  INFO -- : master process ready
08:06:58 web.1  | I, [2013-02-25T08:06:58.520232 #59718]  INFO -- : worker=0 ready
```

## Submit a talk for the next edition

1. Fork [this repo](https://github.com/opencodeqc/opencode.ca).

2. Do it.

      ```shell
      $ bundle exec rake console
      > Talk.create(
          title: 'My Awesome Talk',
          author_name: 'Rémi Prévost',
          author_screenname: 'remi',
          edition_id: Edition.last.id
        )
      > exit
      > git checkout -b feature/my-awesome-talk
      > git add data/talks.yml
      > git commit -m 'Add my awesome talk for OpenCode XIII'
      > git remote add my_fork git@github.com:my_username/opencode.ca.git
      > git push my_fork HEAD
      ```

3. Then submit a pull request for us to merge your branch.
