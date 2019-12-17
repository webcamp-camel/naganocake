class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:day]
      @orders = Order.created_today
    else
  	   @orders = Order.all
    end
  end

  def show
  	@order = Order.find(params[:id])
  	@items = @order.ordered_items
  end

  def update
#orderのdeposit_statusの更新
  	@order = Order.find(params[:id])
    @order.update(order_params)
  	redirect_to admins_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:deposit_status,ordered_item_attributes:[:id, :product_status])
  end

end
