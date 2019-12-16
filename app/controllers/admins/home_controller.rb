class Admins::HomeController < ApplicationController
	before_action :authenticate_admin!
  def top

  	 @items = OrderedItem.where(product_status: 1).group(:product_id)
  	 @count = OrderedItem.where(created_at: Date.today).count

  end
end
