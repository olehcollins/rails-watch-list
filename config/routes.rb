Rails.application.routes.draw do
  root "lists#index"

  resources :bookmarks, only: [:index, :destroy]


  resources :lists do
    resources :movies , only: [:show, :index] do
      resources :bookmarks, only: [:new, :create]
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
