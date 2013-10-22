module ContentDriven
  module Routes
    # Walks the tree based on a url and returns the requested page
    # Will return nil if the page does not exist
    def content_for route
      parts = route.split("/").delete_if &:empty?
      content = parts.inject(self) do |page, part|
        page.children[part.to_sym] if page
      end
      content
    end
  end
end