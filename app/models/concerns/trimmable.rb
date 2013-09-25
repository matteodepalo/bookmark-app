module Trimmable
  extend ActiveSupport::Concern

  included do
    cattr_accessor :trimmable_attributes
    before_validation :trim_attributes

    private

    def trim_attributes
      self.class.trimmable_attributes.each do |attribute|
        self.send("#{attribute}=", send(attribute).strip)
      end
    end
  end

  module ClassMethods
    def trimmable(*attributes)
      self.trimmable_attributes = attributes
    end
  end
end