Studio::Application.routes.draw do
  root to: "top#index"

  resources :members
  resources :bookings
  resources :rooms
  resource :account

  namespace :admin do
    root to: "top#index"
    # 会員を閲覧,作成,削除できる
    resources :members, only: [:index, :show, :new, :create, :destroy]
    # 予約を削除できる
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
    # 部屋を削除できる
    resources :rooms, only: [:index, :destroy]
    # 機材を編集, 削除できる
    resources :materials
  end

  get "login" => "top#login", as: "login"

  resource :session, only: [:create, :destroy]
end