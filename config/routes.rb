Rails.application.routes.draw do
  resources :hoges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post 'logout', to: 'sessions#logout'

  resources :omikujis, only: %i[index create destroy]
end
