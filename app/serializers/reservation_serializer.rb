class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date, :city, :motorcycle_name

  def motorcycle_name
    object.motorcycle.name
  end
end
