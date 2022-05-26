class OrderShippingInfo
  include ActiveModel::Model
  attr_accessor :zip, :ken_name_id, :city_name, :address, :building, :tel, :user_id, :item_id, :price, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :ken_name_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city_name
    validates :address
    validates :tel, numericality: { with: /^0[0-9]{9,10}$/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: user_id)
    ShippingInfo.create(zip: zip, ken_name_id: ken_name_id, city_name: city_name, address: address, building: building, tel: tel, order_id: order.id)
  end
end