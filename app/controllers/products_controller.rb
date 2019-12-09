class ProductsController < ApplicationController

#商品一覧ページ
	def index
		@products = Product.all

	end

# 顧客側の商品一覧ページ
	def show
		@product = Product.find(params[:id])
	end

	def additem
		@product = Product.new(product_params)
		@product.save
		redirect_to cart_items(@product.id)
	end

	private

	def product_params
		params.require(:product).permit(:image_id, :name, :introduction)
	end
end