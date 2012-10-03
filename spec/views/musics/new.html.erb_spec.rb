require 'spec_helper'

describe "musics/new" do
  before(:each) do
    assign(:music, stub_model(Music,
      :title => "MyString",
      :project_id => 1,
      :artist => "MyString",
      :spotify_uri => "MyString"
    ).as_new_record)
  end

  it "renders new music form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => musics_path, :method => "post" do
      assert_select "input#music_title", :name => "music[title]"
      assert_select "input#music_project_id", :name => "music[project_id]"
      assert_select "input#music_artist", :name => "music[artist]"
      assert_select "input#music_spotify_uri", :name => "music[spotify_uri]"
    end
  end
end
