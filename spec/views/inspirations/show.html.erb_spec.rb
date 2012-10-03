require 'spec_helper'

describe "inspirations/show" do
  before(:each) do
    @inspiration = assign(:inspiration, stub_model(Inspiration,
      :title => "Title",
      :image => "Image",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Image/)
    rendered.should match(/1/)
  end
end
