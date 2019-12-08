class UsersController < ApplicationController

before_action :set_user


  def show
  end

  def edit
  end

  def update
  	@user.update(user_params)
  end

  private
  	def set_user
  		@user = current_user
  	end

  	def user_params
  		params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone, :email)
  	end
end
