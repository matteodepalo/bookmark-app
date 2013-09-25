BookmarkApp::Application.routes.draw do
  resources :bookmarks
  resources :sites, only: :show

  root to: 'bookmarks#index'
end
