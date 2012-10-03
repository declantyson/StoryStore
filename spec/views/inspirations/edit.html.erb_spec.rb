require 'spec_helper'

describe "inspirations/edit" do
  before(:each) do
    @inspiration = assign(:inspiration, stub_model(Inspiration,
      :title => "MyString",
      :image => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit inspiration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inspirations_path(@inspiration), :method => "post" do
      assert_select "input#inspiration_title", :name => "inspiration[title]"
      assert_select "input#inspiration_image", :name => "inspiration[image]"
      assert_select "input#inspiration_project_id", :name => "inspiration[project_id]"
    end
  end
end
