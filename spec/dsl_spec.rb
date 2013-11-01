require 'spec_helper'
require 'content_driven'
require 'content_driven/page'

describe ContentDriven::Page do

  it "will extend the DSL when subclassed" do
    class ContentDriven::HamsterJam < ContentDriven::Page;end
    expect(ContentDriven::Page.instance_methods.include? :get_hamster_jams).to be_true
    expect(ContentDriven::Page.instance_methods.include? :add_hamster_jam).to be_true
    expect(ContentDriven::Page.instance_methods.include? :get_hamster_jam).to be_true
  end

  it "will gain a method of the form add_x when subclassed" do
    class ContentDriven::Pony < ContentDriven::Page;end
    expect(ContentDriven::Page.instance_methods.include? :add_pony).to be_true
    page = ContentDriven::Page.new
    page.add_pony :wow_a_pony
    expect(page.length).to eq(1)
    expect(page[:wow_a_pony].class).to be(ContentDriven::Pony)
  end

  it "will gain a method of the form get_x when subclassed" do
    class ContentDriven::Awesomeness < ContentDriven::Page;end
    expect(ContentDriven::Page.instance_methods.include? :get_awesomeness).to be_true
    page = ContentDriven::Page.new
    awe = ContentDriven::Awesomeness.new
    page.add_awesomeness :awe
    awe = page.get_awesomeness :awe
    expect(awe.class).to be(ContentDriven::Awesomeness)
  end

  it "will gain a method of the form add_x when subclassed" do
    class ContentDriven::Cat < ContentDriven::Page; end
    class ContentDriven::Dog < ContentDriven::Page; end
    expect(ContentDriven::Page.instance_methods.include? :get_cats).to be_true
    page = ContentDriven::Page.new do
      add_cat :first
      add_cat :second
      add_dog :third
      add_cat :fourth
      add_dog :fifth
    end
    puts "Cats"
    expect(page.length).to be(5)
    expect(page.get_dogs.length).to be(2)
    expect(page.get_cats.length).to be(3)
  end

end