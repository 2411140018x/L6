class Product < ApplicationRecord
  # 商品を削除したら、カートに入っているその商品も削除する
  has_many :cart_items, dependent: :destroy

  validates :name, presence: { message: "商品名を入力してください" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                    message: "価格は0以上の整数で入力してください" }
end
