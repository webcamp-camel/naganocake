Rails.application.routes.draw do

#認証機能に関して
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

#管理者権限
  namespace :admins do
  	resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :toggle
      end
    end
  	resources :genres, only: [:index, :create, :update] do
      member do
        patch :enable
        patch :disable
      end
    end

  	resources :products, except: [:destroy]
  	resources :orders, only: [:index, :update, :show]
  end

#顧客表示部分

	resources :users, only: [:show, :edit, :update] do
    member do
      patch :leave
    end
  end
	resources :products, only: [:show]
	resources :cart_items, only: [:index, :create, :destroy]

  get 'orders/finish' => 'orders#finish'
	resources :orders, only: [:index, :show, :new, :create] do
    member do
      get :confirm
    end
  end
	resources :ship_to_addresses, only: [:create, :index, :destroy, :edit, :update]

  get 'home/about' => 'home#about'

  delete :cart_items, to: 'cart_items#destroy_all'
  patch :cart_items, to: 'cart_items#update_all'

  get 'admins' => 'admins/home#top'

  root to: 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
