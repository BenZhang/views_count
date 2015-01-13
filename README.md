# ViewsCount

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'views_count'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install views_count

Generate the config file and table migration

    $ rails g views_count

This allows you to attach views count method to an AR model instance. By default, 
it requires a column views_count to keep track of the view hits. You can specify column_name to whatever fits your situation.
    has_views_count
    has_views_count column_name: 'views_count'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/views_count/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
