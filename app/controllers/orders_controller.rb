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
		@order = Order.new
	end

# 情報の保存
	def create
	end

# 注文完了画面
	def finish
	end

end

