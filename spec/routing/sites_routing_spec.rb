require "spec_helper"

describe SitesController do
  describe "routing" do

    it "routes to #show" do
      get("/sites/1").should route_to("sites#show", :id => "1")
    end

  end
end
