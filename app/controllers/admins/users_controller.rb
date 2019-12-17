class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
        flash[:success] = "更新に成功しました"
        redirect_to admins_user_path(@user)
    else
       flash[:warning] = "入力内容を確認してください"
        render :edit
    end
  end

  def toggle
  	@user = User.find(params[:id])

  	if @user.is_deleted?
  		  @user.is_deleted = false
  	else
  		  @user.is_deleted = true
  	end
        @user.save
        redirect_to edit_admins_user_path(@user)
  end

  private
  	def user_params
  		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :phone, :email, :is_deleted)
  	end
end
