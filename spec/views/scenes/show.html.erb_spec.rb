require 'spec_helper'

describe "scenes/show" do
  before(:each) do
    @scene = assign(:scene, stub_model(Scene,
      :title => "Title",
      :project_id => 1,
      :image => "Image",
      :entry => "Entry",
      :themes => "Themes"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Image/)
    rendered.should match(/Entry/)
    rendered.should match(/Themes/)
  end
end
