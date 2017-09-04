class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :book_id, :user_id, :from, :to, presence: true
end
