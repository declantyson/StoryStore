require "spec_helper"

describe MusicsController do
  describe "routing" do

    it "routes to #index" do
      get("/musics").should route_to("musics#index")
    end

    it "routes to #new" do
      get("/musics/new").should route_to("musics#new")
    end

    it "routes to #show" do
      get("/musics/1").should route_to("musics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/musics/1/edit").should route_to("musics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/musics").should route_to("musics#create")
    end

    it "routes to #update" do
      put("/musics/1").should route_to("musics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/musics/1").should route_to("musics#destroy", :id => "1")
    end

  end
end
