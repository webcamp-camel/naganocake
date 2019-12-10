class CartItemsController < ApplicationController


  def index
    @cart_items = current_user.cart_items
  end

  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.user_id = current_user.id
    @cart_item.save
    redirect_to cart_items_path
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
    def item_params
      params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end

    def product_total_price(price,quantity)
      return price * quantity
    end
end
