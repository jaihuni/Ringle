Rails.application.routes.draw do
  root "musics#index"

  resources :articles do
    resources :comments
  end

  resources :musics

  resources :users do
    resources :playlists do
      resources :list_musics

      post "add_musics"
      get "add_musics"
      delete "delete_musics"
      get "delete_musics"
    end
  end

  resources :groups do
    resources :group_users
    resources :group_playlists do
      resources :group_musics
    end
  end
end
