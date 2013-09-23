module Sodium
  class Blog

    attr_accessor :posts

    def initialize &block
      self.posts = {}
      self.instance_eval &block
    end

    def add_post key, &block
      post = BlogPost.new(key, &block)
      post.blog = self
      self.posts[key] = post
    end

    def post key
      self.posts[key]
    end

    def last_post
      self.posts.values.last
    end

    def next_post key
      keys = post.keys
      self.posts[keys[keys.index_of(key) + 1]]
    end

    def prev_post key
      keys = post.keys
      self.posts[keys[keys.index_of(key) + 1]]
    end

  end
end