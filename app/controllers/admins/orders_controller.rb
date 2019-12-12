class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def update
  end

  def show
  end
end
