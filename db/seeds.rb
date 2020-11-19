require "csv"
require "faker"

# Clearing our data
Product.delete_all
Brand.delete_all

# Loop through the rows of a CSV file
csv_file = Rails.root.join("db/perfume.csv")

csv_data = File.read(csv_file)

perfumes = CSV.parse(csv_data, headers: true, encoding: "utf-8")

perfumes.each do |perfume|
  brand = Brand.find_or_create_by(name: perfume["Brand"])

  p = brand.products.create(
    sku:         Faker::Barcode.unique.upc_a,
    name:        perfume["Name"],
    price:       Faker::Commerce.price(range: 30..100.0),
    sale_price:  Faker::Commerce.price(range: 30..100.0),
    stock:       Faker::Number.within(range: 5..500),
    description: Faker::Marketing.buzzwords
  )

  puts "Invalid perfume #{perfume['Name']}" unless p&.valid?
end

puts "Created #{Brand.count} brands"
puts "Created #{Product.count} products"
