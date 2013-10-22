module ContentDriven
  class TagCloud < Page
    attr_accessor :tags
    def initialize
      tags = {}
      super
    end
  end
end