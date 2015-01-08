Studio::Application.routes.draw do
  root to: "top#index"

  # 会員
  resources :members, only: [:show, :new, :create]
  # 予約
  resources :bookings, only: [:show, :new, :create, :destroy] do
    collection { get "search" }
  end # 部屋
  resources :rooms, only: :index
  # 機材
  resources :materials, only: [:index, :show]
  # 機材予約
  resources :booked_Materials, only: [:new, :create]

  # アカウント
  resource :account, only: [:show, :edit, :update, :destroy] do
    resources :bookings, only: [:show]
  end

  namespace :admin do
    root to: "top#index"
    # 会員を閲覧,作成,削除できる
    resources :members, only: [:index, :show, :new, :create, :destroy] do
      member { put "recover" } # メンバーの再開
    end
    # 予約を閲覧,詳細確認,作成,削除できる
    resources :bookings, only: [:index, :show, :destroy]
    # 部屋を閲覧,削除できる
    resources :rooms, only: [:index, :destroy]
    # 機材を閲覧,編集,登録,削除できる
    resources :materials do
      member { put "recover" }
    end
  end

  # ログイン用ルーティング
  get "login" => "top#login", as: "login"
  resource :session, only: [:create, :destroy]
end
