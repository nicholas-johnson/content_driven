require_relative "support"
require_relative "dsl"
require_relative "page_list"
require_relative "hooks"
require_relative "routes"
require 'active_support/core_ext/string'

module ContentDriven

  # ContentDriven defines a tree of content. Page is the base class.
  # A Page has a parent and zero or more children
  class Page < Hash
    attr_accessor :parent, :url, :title, :date

    extend ContentDriven::DSL
    include ContentDriven::Routes
    extend ContentDriven::Hooks

    # Extend the DSL when Page is subclasses
    def self.inherited(subclass)
      define_dsl_for(subclass)
    end

    def initialize &block
      if block_given?
        self.instance_eval &block
      end
      self.class.call_after_hooks
    end

    # Add a child page. You will seldom need to call this directly.
    # Instead use add_blog or add_article
    def add_child key, page = nil
      if key.is_a? Page
        page, key = key, (self.keys.length + 1).to_sym
      end
      page.parent = self
      page.url = key
      self[key] = page
    end

    # Is this a root page, i.e. it has no parent?
    def root?
      self.parent.nil?
    end

    # Returns the URL fragment as a symbol, or :root if it is the root page
    def to_sym
      root? ? :root : self.url.to_sym
    end

    def children
      self
    end


  end
end