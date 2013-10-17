module Stripes
  module Routes
    # Walks the tree based on a url and returns the requested node
    # Will return nil if the node does not exist
    def content_for route
      parts = route.split("/").delete_if &:empty?
      content = parts.inject(self) do |node, part|
        node.children[part.to_sym] if node
      end
      content
    end
  end
end