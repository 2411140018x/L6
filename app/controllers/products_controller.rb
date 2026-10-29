class ProductsController < ApplicationController
  # 商品一覧
  def index
    @products = Product.order(:id)
  end

  # 商品登録フォーム
  def new
    @product = Product.new
  end

  # 商品登録
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "「#{@product.name}」を登録しました"
    else
      render "new", status: :unprocessable_content
    end
  end

  # 商品削除
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: "「#{product.name}」を削除しました", status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
