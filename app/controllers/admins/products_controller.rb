class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "登録に成功しました"
      redirect_to admins_products_path
    else
      flash[:warning] = "入力内容を確認してください"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "更新に成功しました"
      redirect_to admins_products_path
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :image, :price, :introduction, :genre_id, :is_stopped)
    end
end
