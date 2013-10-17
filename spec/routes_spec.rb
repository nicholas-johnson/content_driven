require 'spec_helper'
require 'stripes_dsl'
require 'stripes_dsl/node'
require 'stripes_dsl/site'
require 'stripes_dsl/blog'
require 'stripes_dsl/blog_post'

describe Stripes::Node do
  before :all do
    @blog_title = blog_title = "The Many Uses of Toast"
    @post_title = post_title = ["Decoration", "Recreation", "Procreation"]
    @site = Stripes::Site.new do
      add_blog :blog do
        self.title = blog_title
        add_blog_post :post_1 do
          self.title = post_title.first
        end
        add_blog_post :post_2 do
          self.title = post_title.last
        end
      end
    end
  end

  context "/" do
    it "can get the current node" do
      expect(@site.content_for("/")).to be @site
    end
  end

  context "child" do
    before do
      @blog = @site.content_for("blog")
      @post = @blog.content_for("post_1")
    end
    it "can find by name" do
      expect(@blog).to_not be_nil
      expect(@blog.title).to be(@blog_title)
    end
    it "can find by name again" do
      expect(@post.title).to be(@post_title.first)
    end
  end

  context "descendent" do
    before do
      @post_1 = @site.content_for("/blog/post_1")
      @post_2 = @site.content_for("/blog/post_2")
    end
    it "can find by name" do
      expect(@post_1.title).to be(@post_title.first)
      expect(@post_2.title).to be(@post_title.last)
    end
  end

  context "404" do
    it "will return nil" do
      expect(@site.content_for("/fdsafds")).to be_nil
      expect(@site.content_for("/blog/fdsafds")).to be_nil
      expect(@site.content_for("/fdsafds/gfdsgfd")).to be_nil
      expect(@site.content_for("/gfdsgfd/gfdsgfd/gfdsgfd")).to be_nil
    end
  end
end