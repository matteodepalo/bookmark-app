require 'spec_helper'

Temping.create :trimmable_model do
  with_columns do |t|
    t.string :name
  end

  include Trimmable

  trimmable :name
end

describe SearchableModel do
  it 'trims attributes white spaces' do
    trimmable_model = TrimmableModel.new(name: 'test ')
    trimmable_model.save!
    trimmable_model.name.should eq('test')
  end
end