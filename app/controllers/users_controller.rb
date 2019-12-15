class UsersController < ApplicationController

#ログインユーザーのみ
  before_action :authenticate_user!

#退会済みユーザー
  before_action :user_is_deleted

  before_action :set_user

# 顧客詳細画面
  def show
      unless current_user.id == @user.id
          redirect_to root_path
      end
  end
# 顧客編集画面
  def edit
      unless current_user.id == @user.id
          redirect_to root_path
      end
  end

# 顧客編集画面で変更された内容を保存
  def update
  	@user.update(user_params)
  end

#退会機能
  def leave
      @user.is_deleted = true
      @user.save
      redirect_to destroy_user_session_path
  end

  private
# @userの値をセット
  	def set_user
  		@user = User.find(params[:id])
  	end

# ストロングパラメーター
  	def user_params
  		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email, :is_deleted)
  	end

#退会済みユーザーへの対応
    def user_is_deleted
      if current_user.is_deleted?
        redirect_to root_path
      end
    end

end
