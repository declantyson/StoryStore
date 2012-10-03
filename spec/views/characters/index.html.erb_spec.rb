require 'spec_helper'

describe "characters/index" do
  before(:each) do
    assign(:characters, [
      stub_model(Character,
        :name => "Name",
        :project_id => 1,
        :image => "",
        :personality => "Personality",
        :quotes => "Quotes"
      ),
      stub_model(Character,
        :name => "Name",
        :project_id => 1,
        :image => "",
        :personality => "Personality",
        :quotes => "Quotes"
      )
    ])
  end

  it "renders a list of characters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Personality".to_s, :count => 2
    assert_select "tr>td", :text => "Quotes".to_s, :count => 2
  end
end
