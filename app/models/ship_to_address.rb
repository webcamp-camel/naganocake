class ShipToAddress < ApplicationRecord

	belongs_to :user


    validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    validates :postal_code, format: /\A[0-9]+\z/ #郵便番号数字のみ
    validates :phone, format:/\A[0-9]+\z/ #電話番号数字のみ
end
