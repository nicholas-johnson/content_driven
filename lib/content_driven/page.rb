require_relative "support"
require_relative "dsl"
require_relative "page_list"
require_relative "routes"
require 'active_support/core_ext/string'

module ContentDriven

  # ContentDriven defines a tree of content. Page is the base class.
  # A Page has a parent and zero or more children
  class Page
    attr_accessor :parent, :children, :url, :title, :date

    extend ContentDriven::DSL
    include ContentDriven::Routes

    # Extend the DSL when Page is subclasses
    def self.inherited(subclass)
      define_dsl_for(subclass)
    end

    def initialize &block
      self.children = PageList.new
      if block_given?
        self.instance_eval &block
      end
    end

    # Add a child page. You will seldom need to call this directly.
    # Instead use add_blog or add_article
    def add_child key, page = nil
      if key.is_a? Page
        page, key = key, (children.keys.length + 1).to_sym
      end
      page.parent = self
      page.url = key
      children[key] = page
    end

    # Is this a root page, i.e. it has no parent?
    def root?
      self.parent.nil?
    end

    # Returns the URL fragment as a symbol, or :root if it is the root page
    def to_sym
      if root?
        return :root
      else
        return self.url.to_sym
      end
    end

  end
end