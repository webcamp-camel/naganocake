class Admins::UsersController < ApplicationController

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
  	@user.update(user_params)
  	redirect_to admins_user_path(@user)
  end

  private
  	def user_params
  		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :phone, :email)
  	end
end
