class OrderedItemsController < ApplicationController

	def create
		items = params[:items]
		@total_price = items.sum(:price)
		redirect_to new_order_path
	end

	def confirm
	end
end
