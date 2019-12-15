class OrdersController < ApplicationController
#管理者とログインユーザーのみ閲覧可
	 before_action :authenticate!
#退会済みユーザーは閲覧不可
 	before_action :user_is_deleted

 	before_action :params_check, only: [:index]


# 顧客の注文履歴一覧ページ
	def index
		@user = User.find(params[:id])
		@orders = @user.orders
	#他のuserのアクセス阻止
		unless current_user.nil? || current_user.id == @user.id
			redirect_to orders_path(id: current_user.id)
		end
	end

# 注文履歴詳細ページ
	def show
	 	@order = Order.find(params[:id])

	# 他のuserのアクセス阻止
		unless current_user.nil? || current_user.id == @order.user_id
			redirect_to orders_path(id: current_user.id)
		end
	end

# 顧客の購入情報の入力画面
	def new
		@user = current_user
	#cartが空の場合、cart_items#indexに戻される
		if @user.cart_items.blank?
			redirect_to cart_items_path
		else
			@order = Order.new(user_id: @user.id)
			@ads = @user.ship_to_addresses
			@ship_to_address = ShipToAddress.new(user_id: @user.id)
		end
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

		#保存できたかどうかで分岐
		if @order.save
			redirect_to confirm_order_path(@order)
		else
			render :new
		end
	end

#注文情報確認画面
	def confirm
		@order = Order.find(params[:id])
	# 他のuserのアクセス阻止
		unless current_user.nil? || current_user.id == @order.user_id
			redirect_to orders_path(id: current_user.id)
		end
		@items = @order.ordered_items
	end

# 注文完了画面(カートを空にする)
	def finish
		cart_items = current_user.cart_items
		cart_items.destroy_all
	end


	private
#ストロングパラメーター
	 def order_params
	 	params.require(:order).permit(
	 		:user_id, :payment, :ship_address, :ship_postal_code, :last_name, :first_name, :last_name_kana, :first_name_kana,
	 		ship_to_address:[:postal_code, :address, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone]
	 		)
	 end

#退会済みユーザーへの対応
    def user_is_deleted
      if user_signed_in? && current_user.is_deleted?
         redirect_to root_path
      end
    end

#adminでなければuserの中で振り分ける
    def authenticate!
      if admin_signed_in?
      else
      	authenticate_user!
     end
    end

#ordersと直打ちした場合
    def params_check
    	if params[:id].nil?
    		redirect_to root_path
    	end
    end
end

