# Content Driven Gem

A super clean DLS for defining blogs and websites with an emphasis on clean **Information Architecture**, sensible **Metadata** and **SEO**. Filesystem based so no database required. Works with any Ruby framework but plays especially nicely with Sinatra.

Aimed at developers. Define your site architecture using the simple Ruby DSL. Write your content in HAML, Markdown, ERB, whatever suits. Push to Heroku and you're live!

Create custom content types simply by subclassing ContentDriven::Page. The DSL will learn and adapt.

Define your site using calls like blog_post :post_title.

## No database

I blog on the train. I have no network access, so no access to a remote CMS. I wanted to be able to write my blog posts in HAML, and store them in a Git repository.

I wrote Stripes to help me do that.

## Sinatra

Stripes will work with any Ruby framework from Camping to Rails, but plays especially well with Sinatra. If you'd like to use Sinatra, check out the Stripes_sinatra gem instead. (note: not yet available)

## Heroku

Stripes is fully compatible with Heroku. Get your blog live in minutes on Heroku free tier.

## Installation

Add this line to your application's Gemfile:

    gem 'content_driven'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install content_driven

## Usage

Define your website like so

    @website = ContentDriven::Site.new do
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

## Adding additional content types

Add additional content types by subclassing Stripes::Page. eg.

    class Product < Stripes::Page
      attr_accessor :price
    end

You can now call methods like this:

    site = Stripes::Site do
      add_product :kitty do
        self.title = "Teeny black kitten"
        self.price = 5.99
      end
    end

    site.products.length
    # => 1

    site.product[:kitty]
    # => Product

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
