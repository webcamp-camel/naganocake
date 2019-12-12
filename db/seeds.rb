# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
   email: 'test@test.com',
   password: '111111',
   last_name: "佐藤",
   first_name: "智子",
   last_name_kana: "さとう",
   first_name_kana: "ともこ",
   postal_code: "000-0000",
   address: "東京都　豊島区",
   phone: "000-000-0000",
   created_at: "2019-12-10 03:32:19",
   )
OrderedItem.create!(
	price: "100",
	quantity: "5",
	product_status: ""
	)