class CartsController < ApplicationController
  # カートの内容表示
  def show
    @cart_items = @cart.cart_items.includes(:product).order(:id)
  end
end
