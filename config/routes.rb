Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end
  resources :musics do
    get "search", on: :collection
  end
end
