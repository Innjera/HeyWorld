Rails.application.routes.draw do

  root 'top#index'
  resources :autoparts, only:[:show]

  devise_for :sellers

  namespace :sellers do
    root 'top#index'
    resources :autoparts

    get 'new_seller_register_inquiry' => 'inquiry#new_seller_register_inquiry' # 販売企業入力画面
    post 'new_seller_register_inquiry_confirm' => 'inquiry#new_seller_register_inquiry_confirm' # 確認画面
    post 'new_seller_register_inquiry_thanks' => 'inquiry#new_seller_register_inquiry_thanks' # 送信完了画面
  end
end
