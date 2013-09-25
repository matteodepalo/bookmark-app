json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :url, :shortened_url, :title
  json.url bookmark_url(bookmark, format: :json)
end
