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
		@adds = @user.ship_to_addresses
		@ship_to_address = ShipToAddress.new(user_id: @user.id)
	end

# 情報の保存
	def create
		@order = Order.new(order_params)
		@user = current_user
			if params[:_add] == "usersAdd"
				@order.ship_address = @user.address
				@order.ship_name = @user.last_name
				@order.ship_postal_code = @user.postal_code
			elsif params[:_add] == "shipAdds"
				@ad = @ads.find(params[:id])
				@order.ship_to_address = @ad.address
				@order.ship_name = @ad.last_name
				@order.ship_postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
				@ad = ShipToAddress.new(user_id: current_user.id)
				@order.ship_to_address = @ad.address
				@order.ship_name = @ad.last_name
				@order.ship_postal_code = @ad.postal_code
			end
		@order.user_id = @user.id
		@order.save
		redirect_to orders_path
	end

# 注文完了画面
	def finish
	end

	private
	 def order_params
	 	params.require(:order).permit(:user_id, :payment, :ship_address)
	 end

end

