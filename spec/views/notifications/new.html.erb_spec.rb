require 'spec_helper'

describe "notifications/new" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :title => "MyString",
      :user_id => "",
      :read => false
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path, :method => "post" do
      assert_select "input#notification_title", :name => "notification[title]"
      assert_select "input#notification_user_id", :name => "notification[user_id]"
      assert_select "input#notification_read", :name => "notification[read]"
    end
  end
end
