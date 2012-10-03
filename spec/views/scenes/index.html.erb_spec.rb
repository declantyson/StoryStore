require 'spec_helper'

describe "scenes/index" do
  before(:each) do
    assign(:scenes, [
      stub_model(Scene,
        :title => "Title",
        :project_id => 1,
        :image => "Image",
        :entry => "Entry",
        :themes => "Themes"
      ),
      stub_model(Scene,
        :title => "Title",
        :project_id => 1,
        :image => "Image",
        :entry => "Entry",
        :themes => "Themes"
      )
    ])
  end

  it "renders a list of scenes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Entry".to_s, :count => 2
    assert_select "tr>td", :text => "Themes".to_s, :count => 2
  end
end
