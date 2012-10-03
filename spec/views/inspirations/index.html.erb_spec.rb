require 'spec_helper'

describe "inspirations/index" do
  before(:each) do
    assign(:inspirations, [
      stub_model(Inspiration,
        :title => "Title",
        :image => "Image",
        :project_id => 1
      ),
      stub_model(Inspiration,
        :title => "Title",
        :image => "Image",
        :project_id => 1
      )
    ])
  end

  it "renders a list of inspirations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
