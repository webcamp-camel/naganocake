Rails.application.routes.draw do

#認証機能に関して
  devise_for :admins
  devise_for :users

#管理者権限
  namespace :admin do
  	resources :users
  end
#顧客表示部分
	resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
