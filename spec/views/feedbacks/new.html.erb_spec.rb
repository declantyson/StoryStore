require 'spec_helper'

describe "feedbacks/new" do
  before(:each) do
    assign(:feedback, stub_model(Feedback,
      :headline => "MyString",
      :rating => 1,
      :user_id => 1,
      :project_id => 1,
      :scene_id => 1,
      :character_id => 1,
      :location_id => 1,
      :music_id => 1,
      :inspiration_id => 1,
      :comments => "MyString"
    ).as_new_record)
  end

  it "renders new feedback form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feedbacks_path, :method => "post" do
      assert_select "input#feedback_headline", :name => "feedback[headline]"
      assert_select "input#feedback_rating", :name => "feedback[rating]"
      assert_select "input#feedback_user_id", :name => "feedback[user_id]"
      assert_select "input#feedback_project_id", :name => "feedback[project_id]"
      assert_select "input#feedback_scene_id", :name => "feedback[scene_id]"
      assert_select "input#feedback_character_id", :name => "feedback[character_id]"
      assert_select "input#feedback_location_id", :name => "feedback[location_id]"
      assert_select "input#feedback_music_id", :name => "feedback[music_id]"
      assert_select "input#feedback_inspiration_id", :name => "feedback[inspiration_id]"
      assert_select "input#feedback_comments", :name => "feedback[comments]"
    end
  end
end
