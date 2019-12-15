class UsersController < ApplicationController

#ログインユーザーのみ
before_action :authenticate_user!
before_action :set_user

# 顧客詳細画面
  def show
  end
# 顧客編集画面
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
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
    redirect_to :root_path
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

end
