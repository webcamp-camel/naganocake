class Admins::HomeController < ApplicationController
  def top
  	# @top = Order.find(params[:id])
  	# @top_comment = Order.new
  	 @count = Order.where(ship_status:1).count
  	 @orders = Order.where(ship_status:1)

  end
end
