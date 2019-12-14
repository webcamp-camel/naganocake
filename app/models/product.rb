class Product < ApplicationRecord
	# refileを使用する
	attachment :image
	# カートの商品との紐付け
	has_many :cart_items
	# 注文詳細との紐付け
	has_many :ordered_items
	has_many :orders, through: :ordered_items
	# ジャンルとの紐付け
	belongs_to :genre

	scope :active, -> {where(is_stopped: false)}
end
