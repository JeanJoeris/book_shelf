class Book < ApplicationRecord
  validates :title, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end