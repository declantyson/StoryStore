require 'spec_helper'

describe "l_ocations/edit" do
  before(:each) do
    @l_ocation = assign(:l_ocation, stub_model(LOcation,
      :name => "MyString",
      :project_id => 1,
      :image => "MyString"
    ))
  end

  it "renders the edit l_ocation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => l_ocations_path(@l_ocation), :method => "post" do
      assert_select "input#l_ocation_name", :name => "l_ocation[name]"
      assert_select "input#l_ocation_project_id", :name => "l_ocation[project_id]"
      assert_select "input#l_ocation_image", :name => "l_ocation[image]"
    end
  end
end
