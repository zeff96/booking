class MotorcircleSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :finance_fee, :option_to_purchase, :total_amount_payable
end
