# Deta-Ruby

deta-ruby is an unofficial Deta Gem for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deta'
```

or grab it from Github
```ruby
gem 'deta', github: "arubinofaux/deta-ruby"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install deta

## Usage

To access the API, you'll need to create a `Deta::Client` and pass in your project key. You can find your project key at [https://web.deta.sh](https://web.deta.sh)

```ruby
client = Deta::Client.new(project_key: ENV["DETA_PROJECT_KEY"])
```

The client then gives you access to each of the resources.

Responses are created as objects like `Deta::BaseObject`. Having types like `Deta::DriveObject` is handy for understanding what type of object you're working with. They're built using OpenStruct so you can easily access data in a Ruby-ish way.

## Base

```ruby
detabase = client.base("base_name")
```

### Put Items

```ruby
# single item
put = detabase.put({name: "Mike Jones", age: 31, hometown: "Denver"})
put.processed.items.first.key

# multi items
puts = detabase.put([{name: "Mike Jones", age: 31, hometown: "Denver"}, {name: "Mike Dow", age: 25, hometown: "Miami"}])
puts.processed
```

### Get Item

```ruby
detabase.get(key)
```

### Delete Item

```ruby
detabase.delete(key)
```

### Insert Item

```ruby
detabase.insert(name: "Mike Jones", age: 31, hometown: "Denver")

# specify the key
detabase.insert(key: "ab5tsstc9bh8", name: "Mike Jones", age: 31, hometown: "Denver")
```

### Update Item

```ruby
detabase.update(key, set: {hometown: "Miami"})
```

### Query Items

```ruby
detabase.fetch(query: {hometown: "Denver"})
detabase.fetch(query: [{hometown: "Boulder"}, {"age?lt": 33}])

detabase.fetch(query: [{hometown: "Boulder"}], limit: 1, last: "8523bdyxlqww")
```

## Drive

```ruby
detadrive = client.drive("drive_name")
```

### Put File

```ruby
detadrive.put("test.jpg", path: "./test.jpg", content_type: "image/jpeg")

detadrive.put("test.txt", data: "hello")

detadrive.put("test.json", data: {a: 1}.to_json)
```

### List Files

```ruby
detadrive.list(limit: 1, prefix: "avatar")
```

### Get File

```ruby
detadrive.get("image0.jpg")
```

### Delete Files

```ruby
# single delete
detadrive.delete("image0.jpg")

# multi delete
detadrive.delete(["image1.jpg", "image2.jpg"])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arubinofaux/deta-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/arubinofaux/deta-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Deta project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/arubinofaux/deta-ruby/blob/main/CODE_OF_CONDUCT.md).
