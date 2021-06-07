Rails.application.routes.draw do
  resources :hoges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post 'logout', to: 'sessions#logout'

  resources :omikujis, only: %i[index create destroy]
  resources :custom_responses, only: %i[index create destroy]
  namespace :api do
    get 'omikujis/random/:user_id' => 'omikujis#random'
    get 'custom_responses/words' => 'custom_responses#words'
  end
end
