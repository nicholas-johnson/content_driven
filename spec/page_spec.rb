require 'spec_helper'
require 'content_driven'
require 'content_driven/page'

describe ContentDriven::Page do

  before :each do
    @page =  ContentDriven::Page.new
    @title = "Bum Cakes!"
  end

  it "can be initialized with a block" do
    page = ContentDriven::Page.new {add_blog :test}
    expect(page.length).to be(1)
    expect(page[:test].class).to be(ContentDriven::Blog)
  end

  it "can be initialized with a nested block" do
    page = ContentDriven::Page.new do
      add_blog :test do
        add_blog :test_2
      end
    end
    expect(page.length).to be(1)
    expect(page[:test].class).to be(ContentDriven::Blog)
    expect(page[:test].children.length).to be(1)
    expect(page[:test].children[:test_2].class).to be(ContentDriven::Blog)
  end

  it "has a title" do
    @page.title = @title
    expect(@page.title).to be(@title)
  end

  it "can add a child page with a key" do
    child = ContentDriven::Page.new
    @page.add_child :child, child
    expect(@page.length).to be(1)
    expect(@page[:child]).to be(child)
    expect(child.parent).to be(@page)
  end

  it "can add a child page without a key" do
    child = ContentDriven::Page.new
    @page.add_child child
    expect(@page.children.length).to be(1)
    expect(@page.children.keys).to eq([:'1'])
    expect(@page.children[:"1"]).to be(child)
  end

  it "can add a child page with a key and block" do
    @page.add_child :child, ContentDriven::Page.new do
      self.title = @title
    end
  end

end