class Admins::UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
