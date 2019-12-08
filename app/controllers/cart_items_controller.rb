class CartItemsController < ApplicationController
  def index
  	@user = current_user
  	@cart_items = @user.cart_items
  end

  def show
  	@product = Product.find(params[:product_id])
  	@cart_item = @product.cart_items
  end
end
