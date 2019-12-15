class UsersController < ApplicationController

#ログインユーザーのみ
before_action :authenticate_user!
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

#退会機能
  def leave
    @user.is_deleted = true
    @user.save
    redirect_to :root_path
  end

  private
# @userの値をセット
  	def set_user
  		@user = User.find(params[:id])
  	end

    def access
      if current_user.id != @user.id
        redirect_to root_path
      end
    end

# ストロングパラメーター
  	def user_params
  		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email, :is_deleted)
  	end

     def authenticate_user!
      unless user_signed_in? && current_user.is_deleted?
        sign_out
        redirect_to root_path
      end
    end
end
