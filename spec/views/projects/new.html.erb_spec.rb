require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :title => "MyString",
      :user_id => 1,
      :synopsis => "MyString",
      :genres => "MyString",
      :format => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "input#project_user_id", :name => "project[user_id]"
      assert_select "input#project_synopsis", :name => "project[synopsis]"
      assert_select "input#project_genres", :name => "project[genres]"
      assert_select "input#project_format", :name => "project[format]"
    end
  end
end
