# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
user = User.find_or_create_by_email :name => "User example", :email => "user@example", :password => "12345678", :password_confirmation => "12345678"
puts 'user: ' << user.name
user.add_role :user

puts "########################"
puts "###   LOADING DATA   ###"
puts "########################"
categories = ['Educación', 'Entretenimiento', 'Negocios']
product_models = ['Brillante', 'Mate', 'Brillo sectorizado', 'Boleados']

product_names = [['Primer', 'Segundo', 'Tercer'], ['Cuarto', 'Quinto', 'Sexto'], ['Séptimo', 'Octavo', 'Noveno']]
product_description = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
                      Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
                      Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim."
product_image = "product_test_123.jpeg"
product_prices = [10, 5]
index = 0

categories.each_with_index do |category_name, i|
  category = Category.find_or_create_by(name: category_name)
  puts "  --> #{category.to_s}"
  product_model = ProductModel.find_or_create_by(name: product_models[i], active: true)
  product_names[i].each do |name|
    index += 1
    product = category.products.find_or_initialize_by(name: "#{name} producto")
    product.description = product_description
    product.image = File.open(File.join(Rails.root, "/app/assets/images/products/#{product_image}"))
    product.price = (product_prices[(index % 2)] * (index + 1)).to_i
    product.product_model_id = product_model.id
    product.save!
    puts "    -- #{product.name}"
    puts "      - #{product.product_model.to_s}"
  end
end
