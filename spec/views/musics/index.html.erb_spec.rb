require 'spec_helper'

describe "musics/index" do
  before(:each) do
    assign(:musics, [
      stub_model(Music,
        :title => "Title",
        :project_id => 1,
        :artist => "Artist",
        :spotify_uri => "Spotify Uri"
      ),
      stub_model(Music,
        :title => "Title",
        :project_id => 1,
        :artist => "Artist",
        :spotify_uri => "Spotify Uri"
      )
    ])
  end

  it "renders a list of musics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    assert_select "tr>td", :text => "Spotify Uri".to_s, :count => 2
  end
end
