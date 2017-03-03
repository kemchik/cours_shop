# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.where(email: 'kira@gmail.com').first_or_create
category = Category.where(name: 'Tort').first_or_create(description: 'Some')
product = Product.where(name: 'Tort').first_or_create(description: 'Some', price: 1.0, category: category)
customer = Customer.where(address: 'Some').first_or_create(phone: '22')
order = Order.where(user: user).first_or_create( product: product, amount: 1, customer: customer)
