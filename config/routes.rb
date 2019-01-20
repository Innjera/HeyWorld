Rails.application.routes.draw do

  ###緊急避難###
  if Rails.env == "production"
    root 'corporate#top'
    get 'corporate' => 'corporate#top'


  elsif Rails.env == "development"

  #何故deviseが一番上に来るべきか https://teratail.com/questions/163615

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations:'users/registrations',
    sessions:'users/sessions'
  }

  devise_for :sellers, controllers: {
    registrations:'sellers/registrations',
    sessions:'sellers/sessions'
  }

  root 'top#index'

  get 'mypage' => 'top#mypage'
  get 'bidded_items' => 'top#bidded_items'

  resources :sellers, only:[:index, :show] do
    get :coming, on: :member
    get :finished, on: :member
  end

  resources :tenders, only:[:index, :show] do
    resources :engines, only:[:show] do
      resources :bid_prices, only:[:new, :create, :edit, :update, :destroy]
    end
  end


  namespace :sellers, path:"organizer" do
    root 'top#index'
    resources :tenders do
      resources :engines
    end
    resource :tender_rule, only:[:show, :new, :create, :edit, :update]
    resources :tender_locations, only:[:new, :edit, :create, :update, :destroy]

    get 'account_info' => 'top#account_info'
    get 'new_seller_register_inquiry' => 'inquiry#new_seller_register_inquiry' # 販売企業入力画面
    post 'new_seller_register_inquiry_confirm' => 'inquiry#new_seller_register_inquiry_confirm' # 確認画面
    post 'new_seller_register_inquiry_thanks' => 'inquiry#new_seller_register_inquiry_thanks' # 送信完了画面
  end

  get 'corporate' => 'corporate#top'

end

end ###緊急避難
