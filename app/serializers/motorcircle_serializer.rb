class MotorcircleSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :bio, :finance_fee, :option_to_purchase, :total_amount_payable, :duration

  def image_url
    if object.image.attached?
      Rails.application.routes.url_helpers.url_for(object.image)
    end
  end
end
