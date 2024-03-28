# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'admin@gmail.com', password: 'admins', password_confirmation: 'admins')

puts "User #{user.email} created!"

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
    title: "Monthly grocery",
    description: "Purchased groceries for the month",
    category: "Shops",
    amount: 150,
    user_id: user.id,
    created_at: (Date.today - 1.month).to_s
  },
  {
    title: "New phone",
    description: "Bought the latest smartphone",
    category: "Other",
    amount: 800,
    user_id: user.id,
    created_at: (Date.today - 3.months).to_s
  },
  {
    title: "Dinner at ABC restaurant",
    description: "Celebratory dinner",
    category: "Cafes",
    amount: 60,
    user_id: user.id,
    created_at: (Date.today - 2.weeks).to_s
  },
  {
    title: "Car service",
    description: "Routine maintenance",
    category: "Other",
    amount: 120,
    user_id: user.id,
    created_at: (Date.today - 6.months).to_s
  },
  {
    title: "First shopping",
    description: "Bought some apples",
    category: Invoice.DEFAULT_CATEGORY[4],
    amount: 10,
    user_id: user.id,
    created_at: (Date.today - 1.year).to_s
  },
  {
    title: "Monthly subscription",
    description: "Paid for streaming service",
    category: Invoice.DEFAULT_CATEGORY[5],
    amount: 15,
    user_id: user.id,
    created_at: (Date.today - 6.month).to_s
  },
  {
    title: "New laptop",
    description: "Purchased a new MacBook",
    category: Invoice.DEFAULT_CATEGORY[4],
    amount: 1200,
    user_id: user.id,
    created_at: (Date.today - 3.month).to_s
  },
  {
    title: "Dinner at fancy restaurant",
    description: "Celebrated anniversary",
    category: Invoice.DEFAULT_CATEGORY[3],
    amount: 100,
    user_id: user.id,
    created_at: (Date.today - 2.month).to_s
  },
  {
    title: "Gym membership",
    description: "Monthly gym fee",
    category: Invoice.DEFAULT_CATEGORY[5],
    amount: 50,
    user_id: user.id,
    created_at: (Date.today - 5.month).to_s
  },
  {
    title: "Books purchase",
    description: "Bought new novels",
    category: Invoice.DEFAULT_CATEGORY[4],
    amount: 40,
    user_id: user.id,
    created_at: (Date.today - 4.month).to_s
  },
  {
    title: "Car maintenance",
    description: "Routine checkup",
    category: Invoice.DEFAULT_CATEGORY[5],
    amount: 200,
    user_id: user.id,
    created_at: (Date.today - 3.month).to_s
  },
  {
    title: "Travel tickets",
    description: "Flight tickets for vacation",
    category: Invoice.DEFAULT_CATEGORY[0],
    amount: 500,
    user_id: user.id,
    created_at: (Date.today - 7.month).to_s
  },
  {
    title: "New smartphone",
    description: "Upgraded to the latest model",
    category: Invoice.DEFAULT_CATEGORY[4],
    amount: 800,
    user_id: user.id,
    created_at: (Date.today - 2.month).to_s
  },
  {
    title: "Home renovation",
    description: "Bathroom makeover",
    category: "Other",
    amount: 3000,
    user_id: user.id,
    created_at: (Date.today - 8.month).to_s
  }
])

puts "#{invoices.length} invoices created!"
