class OrderedItem < ApplicationRecord

	#テーブルの関連づけ
	belongs_to :product
	belongs_to :order

	#validation
	validates :price, presence: true
	validates :quantity, presence: true
	validates :product_status, presence: true
end
