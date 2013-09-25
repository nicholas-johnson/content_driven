module Sodium

  class Website

    attr_accessor :blogs

    def initialize &block
      self.blogs = {}
      self.instance_eval &block
    end

    def add_blog key, &block
      self.blogs[key] = Blog.new &block
    end

    def blog key=nil
      if key
        return blogs[key]
      else
        return blogs[blogs.keys.first]
      end
    end

  end
end
