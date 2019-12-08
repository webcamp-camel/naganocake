class OrderedItem < ApplicationRecord
	#テーブルの関連づけ
	belong_to :product
	belong_to :order

	#Validation
	validates :price, presence: true
	validates :quantity, presence: true
	validates :product_status, presence: true
end
