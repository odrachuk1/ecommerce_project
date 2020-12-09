require 'csv'

Product.destroy_all
Brand.destroy_all
FragranceFamily.destroy_all
Category.destroy_all
Province.destroy_all
Status.destroy_all

csv_file = Rails.root.join('db/brands.csv')
   csv_data = File.path(csv_file)

   CSV.foreach(csv_data, liberal_parsing: true, headers: :first_row) do |brand|
    b = Brand.new
    b.id = brand['id']
    b.name = brand['name']
    b.description = brand['description']
    b.save
    puts "#{b.name}  saved"
   end

   puts "Created #{Brand.count} Brands"


   csv_file = Rails.root.join('db/categories.csv')
   csv_data = File.path(csv_file)

   CSV.foreach(csv_data, liberal_parsing: true, headers: :first_row) do |category|
    b = Category.new
    b.id = category['id']
    b.name = category['name']
    b.description = category['description']
    b.save
    puts "#{b.name}  saved"
   end

   puts "Created #{Category.count} Categories"


   csv_file = Rails.root.join('db/fragranceFamilies.csv')
   csv_data = File.path(csv_file)

   CSV.foreach(csv_data, liberal_parsing: true, headers: :first_row) do |family|
    b = FragranceFamily.new
    b.id = family['id']
    b.name = family['name']
    b.description = family['description']
    b.save
    puts "#{b.name}  saved"
   end

   puts "Created #{FragranceFamily.count} Fragrance Families"

   csv_file = Rails.root.join('db/products.csv')
   csv_data = File.path(csv_file)

   CSV.foreach(csv_data, liberal_parsing: true, headers: :first_row) do |product|
    b = Product.new
    b.id = product['id']
    b.name = product['name']
    b.description = product['description']
    b.price = product['price']
    b.volume = product['volume']
    b.stock_amount = product['stock_amount']
    b.sale = product['sale']
    b.fragrance_family_id = product['fragrance_family_id']
    b.category_id = product['category_id']
    b.brand_id = product['brand_id']
    b.save
    puts "#{b.name}  saved"
   end

   puts "Created #{Province.count} Provinces"

   csv_file = Rails.root.join('db/provinces.csv')
   csv_data = File.path(csv_file)

   CSV.foreach(csv_data, liberal_parsing: true, headers: :first_row) do |province|
    b = Province.new
    b.id = province['id']
    b.name = province['name']
    b.gst_hst = province['gst_hst']
    b.pst = province['pst']

    b.save
    puts "#{b.name}  saved"
   end

   puts "Created #{Province.count} Provinces"

   csv_file = Rails.root.join('db/statuses.csv')
   csv_data = File.path(csv_file)

   CSV.foreach(csv_data, liberal_parsing: true, headers: :first_row) do |status|
    b = Status.new
    b.id = status['id']
    b.name = status['name']
    b.description = status['description']

    b.save
    puts "#{b.name}  saved"
   end

   puts "Created #{Status.count} Statuses"

   if Rails.env.development?
      AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
   end
