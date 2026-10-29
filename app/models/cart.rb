class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  # カート内の商品の合計金額
  def total_price
    cart_items.includes(:product).to_a.sum(&:subtotal)
  end

  # カート内の商品の合計数量
  def total_qty
    cart_items.sum(:qty)
  end
end
