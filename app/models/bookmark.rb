require 'open-uri'

class Bookmark < ActiveRecord::Base
  include Trimmable
  include Searchable

  trimmable :url
  searchable :title, :url

  belongs_to :site
  has_and_belongs_to_many :tags

  validates :url, url: true

  before_save :update_shortened_url, :update_title, :update_site, if: :url_changed?

  def tag_list=(tag_list)
    self.tags = tag_list.split(',').map(&:strip).map{ |tag_name| Tag.where(name: tag_name).first_or_initialize }
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  private

  def update_shortened_url
    self.shortened_url = ShortURL.shorten(url)
  end

  def update_title
    self.title = Nokogiri::HTML(open(url)).css('title').text
  end

  def update_site
    self.site = Site.find_or_initialize_by_url(self.url)
  end
end
