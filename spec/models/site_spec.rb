require 'spec_helper'

describe Site, :stub_shortener, :stub_parsing do
  describe 'self.find_or_initialize_by_url' do
    it 'initializes a new site unless a site with the same domain exists' do
      expect {
        site = Site.find_or_initialize_by_url('http://google.com')
        site.save!
      }.to change(Site, :count).by(1)

      expect {
        site = Site.find_or_initialize_by_url('http://google.com?test')
        site.save!
      }.not_to change(Site, :count).by(1)
    end
  end
end
