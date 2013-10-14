module Sodium
  class TagCloud < Node
    attr_accessor :tags

    def initialize
      tags = {}
    end

    def add_tag
      tag
    end
  end
end