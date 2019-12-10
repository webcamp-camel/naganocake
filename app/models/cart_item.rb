class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :product

	validates :quantity, presence: true


end
