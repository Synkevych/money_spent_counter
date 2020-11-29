class Invoice < ApplicationRecord
  DEFAULT_CATEGORY = ['Traveling', 'Clothing', 'Taxi', 'Cafes', 'Shops', 'Other']

  belongs_to :user

  validates :title, presence: true, length: { in: 1..80 }, uniqueness: true
  validates :category, presence: true, length: { in: 1..40 }

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  scope :available_for, -> (user) { where(user: user) }

  # Set up the number of displayed Checklist items per page
  self.per_page = 10

end 
