require 'spec_helper'

describe Bookmark, :stub_shortener, :stub_parsing do
  it 'has a shortened url' do
    bookmark = Bookmark.create!(url: 'http://google.com?' + 'long' * 10)
    bookmark.shortened_url.should be_present
  end

  it 'has a title' do
    bookmark = Bookmark.create!(url: 'http://google.com')
    bookmark.title.should eq('Google')
  end

  it 'has a site with the domain set to the url host' do
    bookmark = Bookmark.create!(url: 'http://google.com')
    bookmark.site.domain.should eq('google.com')
  end

  it 'has a valid url' do
    bookmark = Bookmark.new(url: 'test')
    bookmark.should be_invalid
    bookmark.errors[:url].first.should eq('is not a valid URL')
  end

  it 'can have a list of tags' do
    bookmark = Bookmark.create(url: 'http://google.com', tag_list: 'tag1, tag2, tag3')
    bookmark.tags.map(&:name).should eq(['tag1', 'tag2', 'tag3'])
  end

  it 'removes unused sites after deletion' do
    bookmark = Bookmark.create!(url: 'http://google.com')
    bookmark.destroy
    Site.count.should eq(0)
  end

  it 'removes unused site after update' do
    bookmark = Bookmark.create!(url: 'http://google.com')
    bookmark.update_attributes(url: 'http://matteodepalo.com')
    bookmark.reload
    Site.count.should eq(1)
    Site.first.domain.should eq('matteodepalo.com')
  end
end
