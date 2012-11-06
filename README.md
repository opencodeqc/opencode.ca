## Run the application

Start the application on `http://0.0.0.0:5005`.

```bash
$ bundle install
$ bundle exec shotgun --port 5005 --host 0.0.0.0
```

## Add URLs to your talk

This is what a talk item looks like, without URLs:

```haml
%li.group
  %img{ :src => "http://twitter.com/api/users/profile_image/remi", :width => "16", :height => "16" }
  %span
    %strong
      %a{ :href => "https://twitter.com/remi" }
        Rémi Prévost
    — Comment contribuer à un projet open-source
```

This is what a talk item should look like, with URLs:

```haml
%li.group
  %img{ :src => "http://twitter.com/api/users/profile_image/remi", :width => "16", :height => "16" }
  %span
    %strong
      %a{ :href => "https://twitter.com/remi" }
        Rémi Prévost
    — Comment contribuer à un projet open-source
    %a.url{ :href => "http://speakerdeck.com/u/remi/foo" } slides
    %a.url{ :href => "https://github.com/remiprev/foo" } code
```

When you are done adding your URLs, send a pull request.
