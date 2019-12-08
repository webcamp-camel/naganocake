Rails.application.routes.draw do

  namespace :admins do
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
  end
  namespace :admins do
    get 'home/top'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/update'
    get 'orders/show'
  end
root to: 'home#top'

#認証機能に関して
  devise_for :admins
  devise_for :users

#管理者権限
  namespace :admin do
  	resources :users, only: [:index, :show, :edit, :update]
  	resources :genres, only: [:index, :crate, :edit, :update]
  	resources :products, except: [:destroy]
  	resources :home, only: [:top]
  	resources :orders, only: [:index, :update, :show]
  end
#顧客表示部分
	resources :users, only: [:show, :edit, :update]
	resources :products, only: [:index, :show]
	resources :cart_items, only: [:index, :destroy, :show, :update, :all_destroy]
	resources :orders, only: [:index, :show, :new, :create, :finish]
	resources :ordered_items, only: [:show]
	resources :ship_to_addresses, only: [:index, :destroy, :edit, :update]
	resources :home, only: [:top, :about]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
