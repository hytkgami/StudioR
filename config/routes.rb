Studio::Application.routes.draw do
  root to: "top#index"

  resources :members
  resources :bookings do
    collection { get "search" }
  end
  resources :rooms
  resource :account

  namespace :admin do
    root to: "top#index"
    # 会員を閲覧,作成,削除できる
    resources :members, only: [:index, :show, :new, :create, :destroy] do
      member { put "recover" } # メンバーの再開
    end
    # 予約を閲覧,詳細確認,作成,削除できる
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
    # 部屋を閲覧,削除できる
    resources :rooms, only: [:index, :destroy]
    # 機材を閲覧,編集,登録,削除できる
    resources :materials
  end

  get "login" => "top#login", as: "login"

  resource :session, only: [:create, :destroy]
end
