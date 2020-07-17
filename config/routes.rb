Rails.application.routes.draw do
  root 'top#home'
  devise_for :users
  resources :posts
end

#deviceでのデフォルトはrootに遷移するので、ログイン後はindexに設定する必要がある