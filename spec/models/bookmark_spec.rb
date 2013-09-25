require 'spec_helper'

describe Bookmark, :stub_shortener, :stub_parsing do
  it 'has a shortened url' do
    bookmark = Bookmark.new(url: 'http://google.com?' + 'long' * 10)
    bookmark.save!
    bookmark.shortened_url.should be_present
  end

  it 'has a title' do
    bookmark = Bookmark.new(url: 'http://google.com')
    bookmark.save!
    bookmark.title.should eq('Google')
  end

  it 'has a site with the domain set to the url host' do
    bookmark = Bookmark.new(url: 'http://google.com')
    bookmark.save!
    bookmark.site.domain.should eq('google.com')
  end
end
