class Order < ApplicationRecord
	# 注文詳細との紐付け
	has_many :ordered_items, dependent: :destroy
	accepts_nested_attributes_for :ordered_items
	# 顧客との紐付け
	belongs_to :user

	#enum_支払い方法
	enum payment: {クレジットカード:1, 銀行振込:2}

	#配送状況
	enum ship_status: {発送待ち:1, 発送済み:2}

	#入金状況
	enum deposit_status: {入金待ち:1,入金済み:2}

end