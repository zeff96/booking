class MotorcircleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :image_url, :bio, :finance_fee, :option_to_purchase, :total_amount_payable, :duration

  def image_url
    if object.image.attached?
      rails_blob_url(object.image, only_path: false)
    end
  end
end
