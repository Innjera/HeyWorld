Rails.application.routes.draw do

  ### i18対応の為のscop -- を入れたが為に追加(https://mikazuki.hatenablog.jp/entry/2016/01/16/041347)
  devise_for :users, skip: [:sign_up, :sign_in, :sign_out, :registrations, :sessions, :passwords, :confirmations, :unlock],
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_for :sellers, skip: [:sign_up, :sign_in, :sign_out, :registrations, :sessions, :passwords, :confirmations, :unlock]

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do

  ###緊急避難###
  if Rails.env == "production"
    root 'corporate#top'
    get 'corporate' => 'corporate#top'

  elsif Rails.env == "development"

  #何故deviseが一番上に来るべきか https://teratail.com/questions/163615

  devise_for :users, skip:[:omniauth_callbacks], controllers: {
    # omniauth_callbacks: 'users/omniauth_callbacks',
    registrations:'users/registrations',
    sessions:'users/sessions'
  }

  devise_for :sellers, skip:[:omniauth_callbacks], controllers: {
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

end

end ###緊急避難
