require 'spec_helper'

describe "l_ocations/show" do
  before(:each) do
    @l_ocation = assign(:l_ocation, stub_model(LOcation,
      :name => "Name",
      :project_id => 1,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Image/)
  end
end
