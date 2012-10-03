require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :title => "Title",
        :user_id => 1,
        :synopsis => "Synopsis",
        :genres => "Genres",
        :format => "Format"
      ),
      stub_model(Project,
        :title => "Title",
        :user_id => 1,
        :synopsis => "Synopsis",
        :genres => "Genres",
        :format => "Format"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Synopsis".to_s, :count => 2
    assert_select "tr>td", :text => "Genres".to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
  end
end
