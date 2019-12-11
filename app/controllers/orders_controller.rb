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
		if params[:_address] == "myAddress"
			pp "マイaddress"
		end
		@order = Order.new(order_params)
		@order.user_id = current_user.id
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

