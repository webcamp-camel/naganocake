class CartItemsController < ApplicationController



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
    def set_item
      @cart_item = CartItem.find(params[:id])
    end

    def set_items
      @user = current_user
      @cart_items = @user.cart_items
    end
end
