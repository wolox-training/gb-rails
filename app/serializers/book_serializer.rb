class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image, :title, :publisher, :year

  def image
    { url: object.image }
  end
end
