module Trimmable
  extend ActiveSupport::Concern

  included do
    before_validation :trim_attributes

    private

    def trim_attributes
      self.class::ATTRIBUTES_TO_TRIM.each do |attribute|
        self.send("#{attribute}=", send(attribute).strip)
      end
    end
  end
end