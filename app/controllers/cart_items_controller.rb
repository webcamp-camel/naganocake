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
    @cart_items = current_user.cart_items
  end

  #ある商品の入ったカートを空にする
  def destroy
    @cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
    redirect_to cart_items_path
  end

  #カートを空にする
  def destroy_all
  	@cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  #再計算する
  def update_all
    @cart_items = current_user.cart_items
    @cart_items.update_all(quantity: params[:quantity])
    redirect_to cart_items_path
  end

  private
    def item_params
      params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end
end
