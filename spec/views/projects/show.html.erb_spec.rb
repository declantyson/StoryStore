require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "Title",
      :user_id => 1,
      :synopsis => "Synopsis",
      :genres => "Genres",
      :format => "Format"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Synopsis/)
    rendered.should match(/Genres/)
    rendered.should match(/Format/)
  end
end
