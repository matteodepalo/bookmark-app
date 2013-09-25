Temping.create :searchable_model do
  with_columns do |t|
    t.string :title
    t.string :url
  end

  include Searchable

  SEARCHABLE_ATTRIBUTES = [:title, :url]
end

describe SearchableModel do
  describe 'self.search' do
    it 'searches on the searchable attributes' do
      searchable_model = SearchableModel.create(title: 'test_title', url: 'http://google.com')
      SearchableModel.search('tes').should eq([searchable_model])
      SearchableModel.search('googl').should eq([searchable_model])
    end
  end
end