class Admins::GenresController < ApplicationController
  #ジャンル管理画面
  def index
  	@genre = Genre.new
<<<<<<< HEAD
=======
  	@genres = Genre.all
>>>>>>> 70791e2d8a241bc2134742e6c91304c943837959
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		redirect_to admins_genres_path
  	else
  		render :index
  	end
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
