require 'spec_helper'

describe "musics/edit" do
  before(:each) do
    @music = assign(:music, stub_model(Music,
      :title => "MyString",
      :project_id => 1,
      :artist => "MyString",
      :spotify_uri => "MyString"
    ))
  end

  it "renders the edit music form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => musics_path(@music), :method => "post" do
      assert_select "input#music_title", :name => "music[title]"
      assert_select "input#music_project_id", :name => "music[project_id]"
      assert_select "input#music_artist", :name => "music[artist]"
      assert_select "input#music_spotify_uri", :name => "music[spotify_uri]"
    end
  end
end
