class OrdersController < ApplicationController
#ログインユーザーのみ閲覧可
before_action :authenticate_user!


# 顧客の注文履歴一覧ページ
	def index
		@user = User.find(params[:id])
		@orders = @user.orders
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
				@order.last_name = @user.last_name
				@order.first_name = @user.first_name
				@order.last_name_kana = @user.last_name_kana
				@order.first_name_kana = @user.first_name_kana
				@order.ship_postal_code = @user.postal_code
			elsif params[:_add] == "shipAdds"
				@ad = @ads.find(params[:ShipToAddress][:id])
				@order.ship_address = @ad.address
				@order.last_name = @ad.last_name
				@order.first_name = @ad.first_name
				@order.last_name_kana = @ad.last_name_kana
				@order.first_name_kana = @ad.first_name_kana
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
				@order.first_name = params[:ship_to_address][:first_name]
				@order.last_name_kana = params[:ship_to_address][:last_name_kana]
				@order.first_name_kana = params[:ship_to_address][:first_name_kana]
				@order.ship_postal_code = params[:ship_to_address][:postal_code]
			end


			#ordered_itemにデータ挿入
			item = []
			@items = @user.cart_items
				@items.each do |i|
					item << @order.ordered_items.build(product_id: i.product_id, price: i.price, quantity: i.quantity, product_status: 1)
				end
			OrderedItem.import item
			@order.save
			redirect_to confirm_order_path(@order)
	end

#注文情報確認画面
	def confirm
		@order = Order.find(params[:id])
		@items = @order.ordered_items
	end

# 注文完了画面(カートを空にする)
	def finish
		cart_items = current_user.cart_items
    	cart_items.destroy_all
	end


	private
	 def order_params
	 	params.require(:order).permit(
	 		:user_id, :payment, :ship_address, :ship_postal_code, :last_name, :first_name, :last_name_kana, :first_name_kana,
	 		ship_to_address:[:postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone]
	 		)
	 end

end

