class Admins::HomeController < ApplicationController
  def top
  	# @top = Order.find(params[:id])
  	# @top_comment = Order.new
  	 @order = Order.find(params[:id])
  	 @order_comment = Order.new

  end
end
