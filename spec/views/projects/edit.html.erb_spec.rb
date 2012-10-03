require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "MyString",
      :user_id => 1,
      :synopsis => "MyString",
      :genres => "MyString",
      :format => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "input#project_user_id", :name => "project[user_id]"
      assert_select "input#project_synopsis", :name => "project[synopsis]"
      assert_select "input#project_genres", :name => "project[genres]"
      assert_select "input#project_format", :name => "project[format]"
    end
  end
end
