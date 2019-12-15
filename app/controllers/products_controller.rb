class ProductsController < ApplicationController

#商品一覧ページ
	def index
		@products = Product.active
		@genre = Genre.all
	end

# 顧客側の商品詳細ページ
	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new(product_id: @product.id)
	end

	private

	def product_params
		params.require(:product).permit(:image_id, :name, :introduction)
	end
end