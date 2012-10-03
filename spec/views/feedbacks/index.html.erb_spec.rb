require 'spec_helper'

describe "feedbacks/index" do
  before(:each) do
    assign(:feedbacks, [
      stub_model(Feedback,
        :headline => "Headline",
        :rating => 1,
        :user_id => 2,
        :project_id => 3,
        :scene_id => 4,
        :character_id => 5,
        :location_id => 6,
        :music_id => 7,
        :inspiration_id => 8,
        :comments => "Comments"
      ),
      stub_model(Feedback,
        :headline => "Headline",
        :rating => 1,
        :user_id => 2,
        :project_id => 3,
        :scene_id => 4,
        :character_id => 5,
        :location_id => 6,
        :music_id => 7,
        :inspiration_id => 8,
        :comments => "Comments"
      )
    ])
  end

  it "renders a list of feedbacks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
