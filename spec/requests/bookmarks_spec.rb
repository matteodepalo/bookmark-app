require 'spec_helper'

describe "Bookmarks" do
  describe "GET /bookmarks" do
    it "responds with success" do
      get bookmarks_path
      response.status.should be(200)
    end
  end
end
