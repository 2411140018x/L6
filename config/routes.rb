Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # 商品：一覧・登録・削除
  resources :products, only: [ :index, :new, :create, :destroy ]

  # ショッピングカート：内容表示（カートはセッションで1つだけなので単数形リソース）
  resource :cart, only: [ :show ]

  # カートの中身：追加・削除
  resources :cart_items, only: [ :create, :destroy ]

  root "products#index"
end
