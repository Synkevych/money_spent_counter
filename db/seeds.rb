# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'admin@gmail.com', password: 'admins', password_confirmation: 'admins')

invoices = Invoice.create([
  {
    title: "First shopping",
    description: "Bought some apples",
    category: "Shops",
    amount: 10,
    user_id: user.id,
    created_at: (Date.today - 1.year).to_s
  },
  {
    title: "Second shopping",
    description: "Bought some apples",
    category: "Shops",
    amount: 100,
    user_id: user.id,
    created_at: (Date.today - 1.year).to_s
  },
  {
    title: "Shopping Egg",
    description: "Bought some egg",
    category: "Shops",
    amount: 20,
    user_id: user.id,
    created_at: (Date.today - 1.year - 1.day).to_s
  },
  {
    title: "Banans",
    description: "Bought some banans",
    category: "Shops",
    amount: 520,
    user_id: user.id,
    created_at: (Date.today - 1.year - 1.day).to_s
  },
  {
    title: "new Second shopping",
    description: "Bought some apples",
    category: "Shops",
    amount: 100,
    user_id: user.id,
    created_at: (Date.today).to_s
  },
  {
    title: "new Shopping Egg",
    description: "Bought some egg",
    category: "Shops",
    amount: 20,
    user_id: user.id,
    created_at: (Date.today).to_s
  },
  {
    title: "new Banans",
    description: "Bought some banans",
    category: "Shops",
    amount: 520,
    user_id: user.id,
    created_at: (Date.today).to_s
  }
])
