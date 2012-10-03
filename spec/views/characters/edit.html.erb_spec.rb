require 'spec_helper'

describe "characters/edit" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "MyString",
      :project_id => 1,
      :image => "",
      :personality => "MyString",
      :quotes => "MyString"
    ))
  end

  it "renders the edit character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characters_path(@character), :method => "post" do
      assert_select "input#character_name", :name => "character[name]"
      assert_select "input#character_project_id", :name => "character[project_id]"
      assert_select "input#character_image", :name => "character[image]"
      assert_select "input#character_personality", :name => "character[personality]"
      assert_select "input#character_quotes", :name => "character[quotes]"
    end
  end
end
