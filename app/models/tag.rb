# In the scope of a larger application I would make the tags association polymorphic

class Tag < ActiveRecord::Base
  include Trimmable

  ATTRIBUTES_TO_TRIM = [:name]

  has_and_belongs_to_many :bookmarks

  validates :name, presence: true
end
