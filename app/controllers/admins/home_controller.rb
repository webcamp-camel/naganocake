class Admins::HomeController < ApplicationController
	before_action :authenticate_admin!
  def top
  	 @items = OrderedItem.created_today
  	 @count = @items.count
  end
end
