class Admins::HomeController < ApplicationController
	before_action :authenticate_admin!
  def top

  	 @count = OrderedItem.where(product_status: 1).count

  end
end
