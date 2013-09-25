require 'spec_helper'

describe SitesController, :stub_shortener, :stub_parsing do
  describe "GET show" do
    it "assigns the requested bookmark as @bookmark" do
      bookmark = Bookmark.create! url: 'http://google.com'
      site = bookmark.site
      get :show, {:id => site.to_param}
      assigns(:site).should eq(site)
    end
  end
end