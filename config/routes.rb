Rails.application.routes.draw do

  root 'top#index'
  resources :autoparts, only:[:index,:show]

  devise_for :sellers

  namespace :sellers do
    root 'top#index'
  end
end
