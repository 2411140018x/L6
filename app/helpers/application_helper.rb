module ApplicationHelper
  # 金額を「1,200円」の形式で表示する
  def yen(price)
    "#{number_with_delimiter(price)}円"
  end
end
