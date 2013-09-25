class Site < ActiveRecord::Base
  has_many :bookmarks

  validate :domain, presence: true, uniqueness: true

  def self.find_or_initialize_by_url(url)
    self.where(domain: URI.parse(url).host).first_or_create
  end
end
