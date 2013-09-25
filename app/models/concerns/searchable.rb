module Searchable
  extend ActiveSupport::Concern

  included do
    cattr_accessor :searchable_attributes

    def self.search(query)
      attributes = self.searchable_attributes
      sql_query = attributes.map{ |attribute| "#{attribute} LIKE ?"}.join(' or ')
      self.where(sql_query, *attributes.map{ "%#{query}%" })
    end
  end

  module ClassMethods
    def searchable(*attributes)
      self.searchable_attributes = attributes
    end
  end
end