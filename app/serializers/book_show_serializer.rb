class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image_url, :title, :publisher, :year
  has_one :actual_rent

  def actual_rent
    object.rents.where('rents.from > :today AND rents.to < :today', today: Time.zone.today).last
  end

  def image_url
    object.image
  end
end
