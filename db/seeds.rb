# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# サンプル商品
[
  [ "りんご", 150 ],
  [ "バナナ", 120 ],
  [ "牛乳", 230 ],
  [ "食パン", 180 ]
].each do |name, price|
  Product.find_or_create_by!(name: name) do |product|
    product.price = price
  end
end
