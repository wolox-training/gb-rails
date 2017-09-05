class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image_url, :title, :publisher, :year

  def image_url
    object.image
  end
end
