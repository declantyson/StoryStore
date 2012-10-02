require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'rail me ruby'" do
      visit '/static_pages/home'
      page.should have_content('rail me ruby')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'Roobn00b | home')
    end
  end
  describe "Help page" do
    it "should have the content 'Problem?'" do
      visit '/static_pages/help'
      page.should have_content('Problem?')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => 'Roobn00b | help')
    end
  end
  describe "About page" do
    it "should have the content 'What are you doing here?'" do
      visit '/static_pages/about'
      page.should have_content('What are you doing here?')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => 'Roobn00b | aboot')
    end
  end
end
