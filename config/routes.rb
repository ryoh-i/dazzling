Rails.application.routes.draw do
  root 'top#home'

  devise_for :users do
    member do
      get :following, :following
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'devise/sessions#new_guest'
    #showのみPrefixが省略されていたため、asを利用し明示的に指定。
    #get 'users/:id/show', to: 'devise/registrations#show', :as => :show_user_registration
  end

  resources :users do
    member do
      get :following, :followers
      get 'users', to:'users/#index'
    end
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'shindan', to:'posts#shindan'

  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

end

# git stash save 7/19
# Saved working directory and index state WIP on feature_add_user#21: 499c23a Merge pull request #20 from ryoh-i/connection_rubocop#17
# iwataryounoMacBook-Pro:config ryo-i$