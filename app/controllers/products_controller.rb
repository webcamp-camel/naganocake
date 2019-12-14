class ProductsController < ApplicationController

#商品一覧ページ
	def index
        if params["genre"]
        	@products = Product.active.where(genre_id: params["genre"])
        else
			@products = Product.active
        end
        @genres = Genre.active
	end

# 顧客側の商品詳細ページ
	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new(product_id: @product.id)
		items = current_user.cart_items

		#既にカートに商品が入っているときは、商品一覧ページに戻る
			if items.pluck(:product_id).include?(@cart_item.product_id)
				flash[:notice] = "その商品はカートに入っています"
				redirect_to root_path
			end
	end

	private

	def product_params
		params.require(:product).permit(:image_id, :name, :introduction)
	end
end