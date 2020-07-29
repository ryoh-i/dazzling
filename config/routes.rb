Rails.application.routes.draw do
  root 'top#home'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'devise/sessions#new_guest'
    get 'users/:id/show', to:'devise/registrations#show'
  end
  resources :posts
end