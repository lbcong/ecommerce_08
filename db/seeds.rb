
n = 15
8.times do |n|
  name = "Oppo F#{n+1}s"
  description = "Oppo's product. That's terrific"
  quantity = 15 + n
  price = 299
  SuggestProduct.create!(
    name: name,
    description: description,
    price: price,
    category_id: 1,
    user_id: 12
  )
end
