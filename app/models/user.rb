class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #配送先との紐付け
  has_many :ship_to_addresses, dependent: :destroy
  #カートの商品との紐付け
  has_many :cart_items, dependent: :destroy
  #注文履歴との紐付け
  has_many :orders, dependent: :destroy

  #validation
  validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postal_code, format: /\A[0-9]+\z/
  validates :phone, format:/\A[0-9]+\z/
end
