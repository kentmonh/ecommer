require "csv"
require "faker"

# Clearing our data
ProductCategory.delete_all
Category.delete_all
Product.delete_all
Brand.delete_all
AdminUser.delete_all

# Loop through the rows of a CSV file
csv_file = Rails.root.join("db/perfume.csv")

csv_data = File.read(csv_file)

perfumes = CSV.parse(csv_data, headers: true, encoding: "utf-8")

perfumes.each do |perfume|
  brand = Brand.find_or_create_by(name: perfume["Brand"])

  next unless brand&.valid?

  price = Faker::Commerce.price(range: 30..100.0)
  random_int = rand(8)
  sale_price = if random_int == 0
                 Faker::Commerce.price(range: price - 10..price - 2)
               else
                 price
               end

  p = brand.products.create(
    sku:         Faker::Barcode.unique.upc_a,
    name:        perfume["Name"],
    price:       price,
    sale_price:  sale_price,
    stock:       Faker::Number.within(range: 5..500),
    description: Faker::Marketing.buzzwords
  )

  next unless p&.valid?

  categories = perfume["Gender"].split(", ").map(&:strip)

  # Randomly add more in categories
  addition_category_weather = ["Summer", "Winter", "All Year"].sample
  addition_category_rare = ["Rare Gem", "", "", "", ""].sample

  categories << addition_category_weather
  categories << addition_category_rare if addition_category_rare == "Rare Gem"

  categories.each do |category_name|
    category = Category.find_or_create_by(name: category_name)
    ProductCategory.create(product: p, category: category)
  end
end

puts "Created #{Brand.count} brands"
puts "Created #{Product.count} products"
puts "Created #{Category.count} categories"
puts "Created #{ProductCategory.count} product categories"

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

