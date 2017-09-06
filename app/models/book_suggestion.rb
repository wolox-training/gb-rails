class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :user_id, :author, :title, :link, presence: true
end
