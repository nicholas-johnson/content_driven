require 'spec_helper'
require 'Stripes'
require 'Stripes/node'

describe Stripes::Node do

  before :each do
    @node =  Stripes::Node.new
    @title = "Bum Cakes!"
  end

  it "can be initialized with a block" do
    node = Stripes::Node.new {add_blog :test}
    expect(node.children.length).to be(1)
    expect(node.children[:test].class).to be(Stripes::Blog)
  end

  it "can be initialized with a nested block" do
    node = Stripes::Node.new do
      add_blog :test do
        add_blog :test_2
      end
    end
    expect(node.children.length).to be(1)
    expect(node.children[:test].class).to be(Stripes::Blog)
    expect(node.children[:test].children.length).to be(1)
    expect(node.children[:test].children[:test_2].class).to be(Stripes::Blog)
  end

  it "has a title" do
    @node.title = @title
    expect(@node.title).to be(@title)
  end

  it "can add a child node with a key" do
    child = Stripes::Node.new
    @node.add_child :child, child
    expect(@node.children.length).to be(1)
    expect(@node.children[:child]).to be(child)
    expect(child.parent).to be(@node)
  end

  it "can add a child node without a key" do
    child = Stripes::Node.new
    @node.add_child child
    expect(@node.children.length).to be(1)
    expect(@node.children.keys).to eq([:'1'])
    expect(@node.children[:"1"]).to be(child)
  end

  it "can add a child node with a key and block" do
    @node.add_child :child, Stripes::Node.new do
      self.title = @title
    end
  end

end