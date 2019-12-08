class CartItemsController < ApplicationController

  before_action: set_user, only: [:add_items, :index, :all_destroy]
  before_action: set_product, only: [:show, :destroy]

  def add_items
  end

  def index
  end

  def show
  end

  def destroy
  	@cart_item.destroy
  end

  def all_destroy
  	@cart_items.destroy
  end

  private
  	def set_user
  		@user = current_user
  		@cart_items = @user.cart_items
  	end

  	def set_product
  		@product = Product.find(params[:product_id])
  		@cart_item = @product.cart_item
  	end
end
