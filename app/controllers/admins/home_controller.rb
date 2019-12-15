class Admins::HomeController < ApplicationController

before_action :authenticate_admin!

  def top
  	# @top = Order.find(params[:id])
  	# @top_comment = Order.new
  	 @count = OrderedItem.where(quantity).count
  	 @orders = OrderedItem.where(quantity)

  end
end
