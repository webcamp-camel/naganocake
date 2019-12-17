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

#    @order.deposit_status = params[:order][:deposit_status]
#    @order.save
#ordered_itemのproduct_statusの更新
#    @items = @order.ordered_items
#      @items.each do |item|
#        item.product_status = params[:ordered_items][:product_status][item.id.to_s]
#        item.save
#      end

     pp @order.errors.full_messages
  	redirect_to admins_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:deposit_status,ordered_items_attributes:[:id, :product_status])
  end

end
