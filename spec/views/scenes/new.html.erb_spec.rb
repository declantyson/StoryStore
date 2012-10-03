require 'spec_helper'

describe "scenes/new" do
  before(:each) do
    assign(:scene, stub_model(Scene,
      :title => "MyString",
      :project_id => 1,
      :image => "MyString",
      :entry => "MyString",
      :themes => "MyString"
    ).as_new_record)
  end

  it "renders new scene form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scenes_path, :method => "post" do
      assert_select "input#scene_title", :name => "scene[title]"
      assert_select "input#scene_project_id", :name => "scene[project_id]"
      assert_select "input#scene_image", :name => "scene[image]"
      assert_select "input#scene_entry", :name => "scene[entry]"
      assert_select "input#scene_themes", :name => "scene[themes]"
    end
  end
end
