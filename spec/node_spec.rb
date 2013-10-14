require 'spec_helper'
require 'sodium'
require 'sodium/node'

# APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
# $: << File.join(APP_ROOT, 'lib/sodium') # so rspec knows where your file could be
# require 'node' # this loads the class you want to test

describe Sodium::Node do

  before :each do
    @node =  Sodium::Node.new
    @title = "Bum Cakes!"
  end

  it "can be initialized with a block" do
    node = Sodium::Node.new {add_blog :test}
    expect(node.children.length).to be(1)
    expect(node.children[:test].class).to be(Sodium::Blog)
  end

  it "can be initialized with a nested block" do
    node = Sodium::Node.new do
      add_blog :test do
        add_blog :test_2
      end
    end
    expect(node.children.length).to be(1)
    expect(node.children[:test].class).to be(Sodium::Blog)
    expect(node.children[:test].children.length).to be(1)
    expect(node.children[:test].children[:test_2].class).to be(Sodium::Blog)
  end

  it "has a title" do
    @node.title = @title
    expect(@node.title).to be(@title)
  end

  it "can add a child node with a key" do
    child = Sodium::Node.new
    @node.add_child :child, child
    expect(@node.children.length).to be(1)
    expect(@node.children[:child]).to be(child)
    expect(child.parent).to be(@node)
  end

  it "can add a child node without a key" do
    child = Sodium::Node.new
    @node.add_child child
    expect(@node.children.length).to be(1)
    expect(@node.children.keys).to eq([:'1'])
    expect(@node.children[:"1"]).to be(child)
  end

  it "can add a child node with a key and block" do
    @node.add_child :child, Sodium::Node.new do
      self.title = @title
    end
  end

end