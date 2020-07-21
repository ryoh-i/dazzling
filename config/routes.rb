Rails.application.routes.draw do
  root 'top#home'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'devise/sessions#new_guest'
  end
  resources :posts
end

# git stash save 7/19
# Saved working directory and index state WIP on feature_add_user#21: 499c23a Merge pull request #20 from ryoh-i/connection_rubocop#17
# iwataryounoMacBook-Pro:config ryo-i$