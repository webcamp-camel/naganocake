class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
    def product_params
      params.require(:product).permit(:name, :image, :price, :introduction, :genre_id)
    end
end
