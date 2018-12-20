Rails.application.routes.draw do

  #何故deviseが一番上に来るべきか https://teratail.com/questions/163615

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_for :sellers, :controllers => { :registrations => :registrations }

  root 'top#index'

  get 'corporation' => 'top#corporation'
  get 'mypage' => 'top#mypage'

  resources :engines, only:[:index, :show]
  resources :tenders, only:[:index, :show]
  resources :sellers, only:[:index, :show]

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
end
