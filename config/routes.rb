Rails.application.routes.draw do
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーdevice
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーshops
  get 'shops/index'
  resources :shops
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーusers
  root 'users#top'
  get 'users/home'
  #------------------------------------------
  #-------resourcesとroot、getを逆にしないとdeviceのコントローラーに取られるのかhomeやtop画面が表示されなかった表示されなかった。
  resources :users
end
