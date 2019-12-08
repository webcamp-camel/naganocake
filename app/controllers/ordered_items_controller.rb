class OrderedItemsController < ApplicationController
	def show
		@ordered_item = Orderd_item.find(params[:id])
	end
end
