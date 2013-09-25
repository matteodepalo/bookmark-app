require 'open-uri'

class Bookmark < ActiveRecord::Base
  belongs_to :site

  validate :url, presence: true
  validate :site, presence: true

  after_save :update_shortened_url, :update_title, if: -> { url_changed? }
  before_validation :add_site

  private

  def update_shortened_url
    self.shortened_url = ShortURL.shorten(url)
  end

  def update_title
    self.title = Nokogiri::HTML(open(url)).css('title').text
  end

  def add_site
    self.site = Site.find_or_initialize_by_url(self.url)
  end
end
