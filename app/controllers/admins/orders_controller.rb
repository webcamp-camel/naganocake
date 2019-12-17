class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@items = @order.ordered_items
  end

  def update
#orderのdeposit_statusの更新
  	@order = Order.find(params[:id])
    @order.deposit_status = params[:order][:deposit_status]
    @order.save
#ordered_itemのproduct_statusの更新
    @items = @order.ordered_items
      @items.each do |item|
        item.product_status = params[:ordered_items][:product_status][item.id.to_s]
        item.save
      end

  	redirect_to admins_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:product_status, :deposit_status, :product_status)
  end

end
