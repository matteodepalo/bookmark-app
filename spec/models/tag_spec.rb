require 'spec_helper'

describe Tag do
  it 'trims name white spaces' do
    tag = Tag.new(name: 'test ')
    tag.save!
    tag.name.should eq('test')
  end
end
