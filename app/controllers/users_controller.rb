class UsersController < ApplicationController

before_action :set_user

# 顧客詳細画面
  def show
  end
# 顧客編集画面
  def edit
  end

# 顧客編集画面で変更された内容を保存
  def update
  	@user.update(user_params)
  end

  private
# @userの値をセット
  	def set_user
  		@user = current_user
  	end
# ストロングパラメーター
  	def user_params
  		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email)
  	end
end
