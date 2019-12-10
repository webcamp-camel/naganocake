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
  	resources :users, only: [:index, :show, :edit, :update]
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
	resources :cart_items, only: [:index, :create, :destroy, :show, :update, :all_destroy]
	resources :orders, only: [:index, :show, :new, :create, :finish]
	resources :ordered_items, only: [:show]
	resources :ship_to_addresses, only: [:create, :index, :destroy, :edit, :update]

  root to: "home#top"
  get 'home/about' => 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
