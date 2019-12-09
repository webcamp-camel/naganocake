class Admins::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def product_params
      params.require(:products).permit(:name, :image, :price, :introduction, :genre_id)
    end
end
