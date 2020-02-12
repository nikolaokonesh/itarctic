Rails.application.routes.draw do
  resources :posts
  resources :headers
  resources :partners
  resources :projects
  resources :rekvisits
  resources :residents
  resources :abouts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
