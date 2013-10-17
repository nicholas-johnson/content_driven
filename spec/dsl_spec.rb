require 'spec_helper'
require 'Stripes'
require 'Stripes/node'

describe Stripes::Node do

  it "will extend the DSL when subclassed" do
    class Stripes::HamsterJam < Stripes::Node;end
    expect(Stripes::Node.instance_methods.include? :get_hamster_jams).to be_true
    expect(Stripes::Node.instance_methods.include? :add_hamster_jam).to be_true
    expect(Stripes::Node.instance_methods.include? :get_hamster_jam).to be_true
  end

  it "will gain a method of the form add_x when subclassed" do
    class Stripes::Pony < Stripes::Node;end
    expect(Stripes::Node.instance_methods.include? :add_pony).to be_true
    node = Stripes::Node.new
    node.add_pony :wow_a_pony
    expect(node.children.length).to eq(1)
    expect(node.children[:wow_a_pony].class).to be(Stripes::Pony)
  end

  it "will gain a method of the form get_x when subclassed" do
    class Stripes::Awesomeness < Stripes::Node;end
    expect(Stripes::Node.instance_methods.include? :get_awesomeness).to be_true
    node = Stripes::Node.new
    awe = Stripes::Awesomeness.new
    node.add_awesomeness :awe
    awe = node.get_awesomeness :awe
    expect(awe.class).to be(Stripes::Awesomeness)
  end

  it "will gain a method of the form add_x when subclassed" do
    class Stripes::Cat < Stripes::Node; end
    class Stripes::Dog < Stripes::Node; end
    expect(Stripes::Node.instance_methods.include? :get_cats).to be_true
    node = Stripes::Node.new do
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