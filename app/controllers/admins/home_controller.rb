class Admins::HomeController < ApplicationController
  def top

  	 @count = OrderedItem.where(product_status: 1).count

  end
end
