class Invoice < ApplicationRecord
  DEFAULT_CATEGORY = ['Traveling', 'Clothing', 'Taxi', 'Cafes', 'Shops', 'Other']

  belongs_to :user

  validates :title, presence: true, length: { in: 1..80 }, uniqueness: true
  validates :category, presence: true, length: { in: 1..40 }

end
