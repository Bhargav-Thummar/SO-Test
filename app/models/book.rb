class Book < ApplicationRecord
  belongs_to :category
  has_many :favourite_books, dependent: :destroy

  validates :title, :auther, :description, presence: true
end
