Rails.application.routes.draw do
  #device
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
    #shops
    resources :shops do
      #ネストする。
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :articles, only: [:show]
    end
    #search機能
    get "search" => "shops#search",as:"search"
    #users
    get 'users/home', to: 'users#home'
    #resourcesとroot、getを逆にしないとdeviceのコントローラーに取られるのかhomeやtop画面が表示されなかった表示されなかった。
    resources :users do
      resources :articles, only: [:destroy,:update,:create]
    end
    #簡単ログイン
    post '/users/guest_sign_in', to: 'users#new_guest'
  end
  #namespace urlを指定パスにしたいときに使う

  scope module: :public do
    root to: 'users#top'
  end
  #scope module urlにパスを出したくなくて、ファイル構成を指定パスにしたい時に使う
end