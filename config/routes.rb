Rails.application.routes.draw do
  root 'top#home'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to:'devise/sessions#new_guest'
  end
  resources :posts
end
