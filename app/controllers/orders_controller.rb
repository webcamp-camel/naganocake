class OrdersController < ApplicationController


# 顧客の注文履歴一覧ページ
	def index
		@orders = Order.all
	end

# 注文履歴詳細ページ
	def show
		@order = Order.find(params[:id])
	end

# 顧客の購入情報の入力画面
	def new
		@user = current_user
		@order = Order.new(user_id: @user.id)
		@ads = @user.ship_to_addresses
		@ship_to_address = ShipToAddress.new(user_id: @user.id)
	end

# 情報の保存
	def create
		@order = Order.new(order_params)
		@user = current_user
		@ads = @user.ship_to_addresses
			if params[:_add] == "usersAdd"
				@order.ship_address = @user.address
				@order.ship_name = @user.last_name
				@order.ship_postal_code = @user.postal_code
			elsif params[:_add] == "shipAdds"
				@ad = @ads.find(params[:ShipToAddress][:id])
				@order.ship_address = @ad.address
				@order.last_name = @ad.last_name
				@order.ship_postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
			#ship_to_addressテーブルに保存させる
				@ad = ShipToAddress.new
				@ad.user_id = @user.id
				@ad.address = params[:ship_to_address][:address]
				@ad.last_name = params[:ship_to_address][:last_name]
				@ad.first_name = params[:ship_to_address][:first_name]
				@ad.last_name_kana = params[:ship_to_address][:last_name_kana]
				@ad.first_name_kana = params[:ship_to_address][:first_name_kana]
				@ad.postal_code = params[:ship_to_address][:postal_code]
				@ad.phone = params[:ship_to_address][:phone]
				@ad.save

				@order.ship_address = params[:ship_to_address][:address]
				@order.last_name = params[:ship_to_address][:last_name]
				@order.ship_postal_code = params[:ship_to_address][:postal_code]
			end
		@order.save
		redirect_to orders_path
	end

# 注文完了画面
	def finish
	end


	private
	 def order_params
	 	params.require(:order).permit(:user_id, :payment, :ship_address, ship_to_address:[:postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone])
	 end

end

