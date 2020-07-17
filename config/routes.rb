Rails.application.routes.draw do
  root 'top#home'
  devise_for :users
  resources :posts
end
