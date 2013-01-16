require 'spec_helper'

describe "notifications/edit" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :title => "MyString",
      :user_id => "",
      :read => false
    ))
  end

  it "renders the edit notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path(@notification), :method => "post" do
      assert_select "input#notification_title", :name => "notification[title]"
      assert_select "input#notification_user_id", :name => "notification[user_id]"
      assert_select "input#notification_read", :name => "notification[read]"
    end
  end
end
