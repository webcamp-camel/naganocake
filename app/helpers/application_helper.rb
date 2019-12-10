module ApplicationHelper
	#税込価格を表示する
	def addTax(price)
		tax_in_price = (price * 1.1).round
	end

	#商品ごとの合計金額を表示する
	def totalPrice(price,quantity)
		total_price = price * quantity
	end
end
