class OrderedItemsController < ApplicationController


	def confirm
		@items = CartItem.includes(:user)
	end
end
