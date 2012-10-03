require 'spec_helper'

describe "musics/show" do
  before(:each) do
    @music = assign(:music, stub_model(Music,
      :title => "Title",
      :project_id => 1,
      :artist => "Artist",
      :spotify_uri => "Spotify Uri"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Artist/)
    rendered.should match(/Spotify Uri/)
  end
end
