# Sodium

A lightweight DLS for defining file based blogs and websites, no database required.

Write your content in HAML, Markdown, ERB, whatever suits you. Place it in

## Installation

Add this line to your application's Gemfile:

    gem 'sodium'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sodium

## Usage

Define your website like so

    @website = Website.new do
      add_blog :my_blog do
        add_post :rule_world
          self.title = "How to Rule the World with Ruby"
        end
        add_post :build_awesome
          self.title = "How to build more awesome"
        end
      end
    end

You'll get back an object of class Website which you can then query like so:

    # Get the default blog
    @blog = @website.blog

    # Get a blog by key if you have more than one
    @website.blog[:by_blog]

    # Get the posts for a blog
    @website.blog.posts

    # Get the first blog post
    @website.blog.first_post


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
