class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :timezone, :booking_open
end
