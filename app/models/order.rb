class Order < ApplicationRecord
	# 注文詳細との紐付け
	has_many :ordered_items, dependent: :destroy
	# 顧客との紐付け
	belongs_to :user

	#enum_支払い方法
	enum payment: {クレジットカード:1, 銀行振込:2}

	#お届け先一覧
	enum address: {自宅:1, 登録済配送先:2, 新規配送先:3}
end