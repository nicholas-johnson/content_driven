module Sodium
  class BlogPost

    attr_accessor :title, :date, :url, :tags, :blog

    def initialize key, &block
      self.url = key
      self.instance_eval &block
    end

    def add_tag

    end

    def next_post
      self.blog.next_post self.url
    end

    def prev_post
      self.blog.prev_post self.url
    end
  end
end