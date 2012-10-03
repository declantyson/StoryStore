require 'spec_helper'

describe "l_ocations/index" do
  before(:each) do
    assign(:l_ocations, [
      stub_model(LOcation,
        :name => "Name",
        :project_id => 1,
        :image => "Image"
      ),
      stub_model(LOcation,
        :name => "Name",
        :project_id => 1,
        :image => "Image"
      )
    ])
  end

  it "renders a list of l_ocations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
