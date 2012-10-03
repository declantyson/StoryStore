require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :name => "MyString",
      :project_id => 1,
      :image => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path(@location), :method => "post" do
      assert_select "input#location_name", :name => "location[name]"
      assert_select "input#location_project_id", :name => "location[project_id]"
      assert_select "input#location_image", :name => "location[image]"
      assert_select "input#location_description", :name => "location[description]"
    end
  end
end
