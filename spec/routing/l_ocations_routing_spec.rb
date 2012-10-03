require "spec_helper"

describe LOcationsController do
  describe "routing" do

    it "routes to #index" do
      get("/l_ocations").should route_to("l_ocations#index")
    end

    it "routes to #new" do
      get("/l_ocations/new").should route_to("l_ocations#new")
    end

    it "routes to #show" do
      get("/l_ocations/1").should route_to("l_ocations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/l_ocations/1/edit").should route_to("l_ocations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/l_ocations").should route_to("l_ocations#create")
    end

    it "routes to #update" do
      put("/l_ocations/1").should route_to("l_ocations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/l_ocations/1").should route_to("l_ocations#destroy", :id => "1")
    end

  end
end
