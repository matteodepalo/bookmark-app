module Searchable
  extend ActiveSupport::Concern

  included do
    def self.search(query)
      attributes = self::SEARCHABLE_ATTRIBUTES
      sql_query = attributes.map{ |attribute| "#{attribute} LIKE ?"}.join(' or ')
      self.where(sql_query, *attributes.map{ "%#{query}%" })
    end
  end
end