require 'spec_helper'

describe Bookmark, :stub_shortener, :stub_parsing do
  it 'trims url white spaces' do
    bookmark = Bookmark.new(url: 'http://google.com ')
    bookmark.save!
    bookmark.url.should eq('http://google.com')
  end

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

  it 'has a valid url' do
    bookmark = Bookmark.new(url: 'test')
    bookmark.should be_invalid
    bookmark.errors[:url].first.should eq('is not a valid URL')
  end

  it 'can have a list of tags' do
    bookmark = Bookmark.new(url: 'http://google.com', tag_list: 'tag1, tag2, tag3')
    bookmark.save!
    bookmark.tags.map(&:name).should eq(['tag1', 'tag2', 'tag3'])
  end
end
