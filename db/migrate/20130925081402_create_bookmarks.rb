class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :shortened_url
      t.string :title
      t.references :site

      t.timestamps
    end
  end
end
