require 'active_support/core_ext/string'

module ContentDriven
  # Extends ContentDriven with methods to create content of all the types it knows about
  module DSL

    # Dynamically extend the DSL when we subclass Page
    def define_dsl_for(subclass)
      class_name = subclass.to_s.split("::").last.camelcase.underscore

      # Allows us to call methods like site.blogs and blog.blog_posts
      define_method("get_#{class_name.pluralise}") do
        self.dup.delete_if do |child|
          !self[child].is_a? subclass
        end
      end

      # Allows us to call methods like site.get_blog which will return the first blog
      define_method("get_#{class_name}") do |url=nil|
        send("get_#{class_name.pluralise}")[url]
      end

      # Allows us to call methods like site.add_blog and blog.add_blog_posts
      define_method "add_#{class_name}" do |key=nil, &block|
        content_class = ContentDriven.const_get class_name.to_s.camelcase
        child = content_class.new &block
        add_child(key, child)
      end
    end
  end
end