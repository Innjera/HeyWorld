Rails.application.routes.draw do

  root 'top#index'

  devise_for :sellers

  namespace :sellers do
    root 'top#index'
  end
end
