class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book, :user

  belongs_to :book, serializer: BookShowSerializer
  belongs_to :user
end
