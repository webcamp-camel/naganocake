class Admins::GenresController < ApplicationController
  #ジャンル管理画面
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		redirect_to admins_genres_path
  	else
  		render :index
  	end
  end

  def enable
  end

  def disable
  end

  def edit
  end

  def update
  end

  private
  	def genre_params
  		params.require(:genre).permit(:name,:is_disable)
  	end
end
