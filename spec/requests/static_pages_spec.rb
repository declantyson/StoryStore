require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'rail me ruby'" do
      visit '/static_pages/home'
      page.should have_content('rail me ruby')
    end
  end
  describe "Help page" do
    it "should have the content 'Problem?'" do
      visit '/static_pages/help'
      page.should have_content('Problem?')
    end
  end
  describe "About page" do
    it "should have the content 'What are you doing here?'" do
      visit '/static_pages/about'
      page.should have_content('What are you doing here?')
    end
  end
end
