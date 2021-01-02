class Invoice < ApplicationRecord
  DEFAULT_CATEGORY = ['Traveling',
                      'Clothing',
                      'Taxi',
                      'Cafes',
                      'Shops',
                      'Other']

  belongs_to :user

  validates :title, presence: true,
                    length: { in: 5..25 },
                    uniqueness: true
  validates :description, length: { minimum: 10 }
  validates :category, presence: true, length: { in: 1..40 }

  scope :current_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  scope :available_for, -> (user) { where(user: user) }

  scope :invoices_for_year, -> { where('extract(year from created_at) = ?', Time.now.strftime("%Y").to_i) }

  # Set up the number of displayed Checklist items per page
  self.per_page = 10

end
