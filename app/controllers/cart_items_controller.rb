class CartItemsController < ApplicationController
#ログインユーザーのみ閲覧可
  before_action :authenticate_user!
#退会済みユーザーは閲覧不可
  before_action :user_is_deleted

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
  @items = current_user.cart_items

  @items.each do |item|
        item.quantity = params[:quantity][item.id.to_s].to_i
        item.price = item.quantity * item.product.price
        item.save
        flash[:success] =  "更新に成功しました"
  end
        flash[:warning] = "入力内容を確認してください"
        redirect_to cart_items_path
  end

  private
    def item_params
      params.require(:cart_item).permit(:user_id, :product_id, :quantity, :price)
    end

    #退会済みユーザーへの対応
    def user_is_deleted
      if user_signed_in? && current_user.is_deleted?
         redirect_to root_path
      end
    end
end
