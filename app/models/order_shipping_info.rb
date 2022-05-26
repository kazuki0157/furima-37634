class OrderShippingInfo
  include ActiveModel::Model
  attr_accessor :zip, :ken_name_id, :city_name, :address, :building, :tel, :user_id, :item_id, :price, :token

  with_options presence: true do
    validates :token
    validates :zip, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :ken_name_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city_name
    validates :address
    validates :tel, { numericality: { only_integer: true }, format: { with: /\A\d{10,11}\z/ } }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingInfo.create(zip: zip, ken_name_id: ken_name_id, city_name: city_name, address: address, building: building, tel: tel,
                        order_id: order.id)
  end
end
