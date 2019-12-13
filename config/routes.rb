Rails.application.routes.draw do



#認証機能に関して
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  devise_for :users

#管理者権限
  namespace :admins do
  	resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :toggle
      end
    end
  	resources :genres, only: [:index, :create, :edit, :update] do
      member do
        patch :enable
        patch :disable
      end
    end

  	resources :products, except: [:destroy]
  	resources :home, only: [:top]
  	resources :orders, only: [:index, :update, :show]
  end
#顧客表示部分
	resources :users, only: [:show, :edit, :update]
	resources :products, only: [:index, :show]
	resources :cart_items, only: [:index, :create, :destroy]
	resources :orders, only: [:index, :show, :new, :create, :finish]
  resources :ordered_items, only: [:create]
	resources :ship_to_addresses, only: [:create, :index, :destroy, :edit, :update]

  root to: "products#index"
  get 'home/about' => 'home#about'

  get 'cart_items/confirm' => 'cart_items#confirm'
  delete :cart_items, to: 'cart_items#destroy_all'
  patch :cart_items, to: 'cart_items#update_all'
  get 'ordered_items/confirm' => 'ordered_items#confirm'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
