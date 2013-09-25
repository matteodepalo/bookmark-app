class CreateBookmarksTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :bookmarks_tags, id: false do |t|
      t.integer :bookmark_id
      t.integer :tag_id
    end
  end
end
