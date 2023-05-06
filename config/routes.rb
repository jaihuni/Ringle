Rails.application.routes.draw do
  root "musics#index"

  resources :articles do
    resources :comments
  end

  resources :musics

  resources :users do
    resources :playlists do
      resources :list_musics do
        post "create_array", on: :collection
        get "create_array_form", on: :collection
        delete "destroy_array", on: :collection
        get "destroy_array_form", on: :collection
      end
    end
  end

  resources :groups
end
