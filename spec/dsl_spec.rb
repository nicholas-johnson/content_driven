require 'spec_helper'
require 'sodium'
require 'sodium/node'

describe Sodium::Node do

  it "will extend the DSL when subclassed" do
    class Sodium::HamsterJam < Sodium::Node;end
    expect(Sodium::Node.instance_methods.include? :get_hamster_jams).to be_true
    expect(Sodium::Node.instance_methods.include? :add_hamster_jam).to be_true
    expect(Sodium::Node.instance_methods.include? :get_hamster_jam).to be_true
  end

  it "will gain a method of the form add_x when subclassed" do
    class Sodium::Pony < Sodium::Node;end
    expect(Sodium::Node.instance_methods.include? :add_pony).to be_true
    node = Sodium::Node.new
    node.add_pony :wow_a_pony
    expect(node.children.length).to eq(1)
    expect(node.children[:wow_a_pony].class).to be(Sodium::Pony)
  end

  it "will gain a method of the form get_x when subclassed" do
    class Sodium::Awesomeness < Sodium::Node;end
    expect(Sodium::Node.instance_methods.include? :get_awesomeness).to be_true
    node = Sodium::Node.new
    awe = Sodium::Awesomeness.new
    node.add_awesomeness :awe
    awe = node.get_awesomeness :awe
    expect(awe.class).to be(Sodium::Awesomeness)
  end

  it "will gain a method of the form add_x when subclassed" do
    class Sodium::Cat < Sodium::Node; end
    class Sodium::Dog < Sodium::Node; end
    expect(Sodium::Node.instance_methods.include? :get_cats).to be_true
    node = Sodium::Node.new do
      add_cat :first
      add_cat :second
      add_dog :third
      add_cat :fourth
      add_dog :fifth
    end
    puts "Cats"
    expect(node.children.length).to be(5)
    expect(node.get_dogs.length).to be(2)
    expect(node.get_cats.length).to be(3)
  end

end