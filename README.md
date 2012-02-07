## Run the application

Start the application on `http://0.0.0.0:5005`.

    $ bundle install
    $ bundle exec shotgun --port 5005 --host 0.0.0.0

## Build the static files

Be sure to run this command before a commit that modifies `.haml` or `.scss` files.

    $ rake build

## Deploy the application

Can you pull it off?

    $ rake deploy