class OrderedItem < ApplicationRecord

	#テーブルの関連づけ
	belongs_to :product
	belongs_to :order

	#validation
	validates :price, presence: true
	validates :quantity, presence: true
	validates :product_status, presence: true

	scope :created_today, -> { where(created_at: Time.zone.now.all_day).select(:product_id).distinct }

	def today_count
		cnt = OrderedItem.group(:product_id).where(product_id: product_id,created_at: Time.zone.now.all_day).sum(:quantity)
		#pp cnt
		cnt[product_id]
	end

enum product_status: {製作待ち:1,製作中:2,製作完了:3}
end
