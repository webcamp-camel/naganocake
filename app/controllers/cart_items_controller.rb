class CartItemsController < ApplicationController


  def index
    @cart_items = current_user.cart_items
    @total_price = @cart_items.sum(:price)


  end

  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.user_id = current_user.id
    #税抜の小計価格を設定
    @cart_item.price = @cart_item.product.price * @cart_item.quantity
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
    @item = @cart_items.where(product_id: params[:product_id], user_id: current_user.id)
    @item.update_all(quantity: params[:quantity])
    @item.update_all(price: (params[:product_price].to_i * params[:quantity].to_i))
    redirect_to cart_items_path
  end

  private
    def item_params
      params.require(:cart_item).permit(:user_id, :product_id, :quantity, :price)
    end
end
