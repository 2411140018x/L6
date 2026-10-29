class CartItemsController < ApplicationController
  # カートに商品を追加する（同じ商品が既にあれば数量を増やす）
  def create
    product = Product.find(params[:product_id])
    qty = params[:qty].to_i
    qty = 1 if qty < 1

    cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    if cart_item.new_record?
      cart_item.qty = qty
    else
      cart_item.qty += qty
    end
    cart_item.save!

    redirect_to cart_path, notice: "「#{product.name}」を#{qty}個カートに追加しました"
  end

  # カートから商品を削除する
  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: "「#{cart_item.product.name}」をカートから削除しました", status: :see_other
  end
end
