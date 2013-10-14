module Sodium
  class TagCloud < Node
    attr_accessor :tags
    def initialize
      tags = {}
      super
    end
  end
end