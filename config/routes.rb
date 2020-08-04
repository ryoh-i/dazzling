Rails.application.routes.draw do
  root 'top#home'

  devise_for :users do
    member do
      get :following, :following
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'devise/sessions#new_guest'
    #下記showは上手くいかないActionController::UrlGenerationErrorが発生してしまう
    get 'users/:id/show', to: 'devise/registrations#show', :as => :show_user_registration
  end

  #resources :users
  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
  end
end

# git stash save 7/19
# Saved working directory and index state WIP on feature_add_user#21: 499c23a Merge pull request #20 from ryoh-i/connection_rubocop#17
# iwataryounoMacBook-Pro:config ryo-i$