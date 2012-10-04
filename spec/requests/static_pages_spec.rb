require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the right title" do
      visit home_path
      page.should have_selector('title', :text => 'StoryStore | Home')
    end
  end
  describe "Help page" do
    it "should have the right title" do
      visit help_path
      page.should have_selector('title', :text => 'StoryStore | Help')
    end
  end
  describe "About page" do
    it "should have the right title" do
      visit about_path
      page.should have_selector('title', :text => 'StoryStore | About')
    end
  end
end
