class OrderedItem < ApplicationRecord

	#テーブルの関連づけ
	belongs_to :product
	belongs_to :order

	#validation
	validates :price, presence: true
	validates :quantity, presence: true
	validates :product_status, presence: true

	enum product_status: {制作待ち:1,製作中:2,制作完了:3}
end
