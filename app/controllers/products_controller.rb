class ProductsController < ApplicationController

#商品一覧ページ
	def index
		@products = Product.all
		@users = Product.recent

	end

# 顧客側の商品詳細ページ
	def show
		@product = Product.find(params[:id])
	end
#カートに入れる(CREATEアクション)
	def additem
		@product = Product.new
	end

	private

	def product_params
		params.require(:product).permit(:image_id, :name, :introduction)
	end
end