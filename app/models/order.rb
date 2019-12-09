class Order < ApplicationRecord
	# 注文詳細との紐付け
	has_many :ordered_items, dependent: :destroy
	# 顧客との紐付け
	belongs_to :user
end