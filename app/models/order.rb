class Order < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems date:datetime user_id:integer delivered_at:datetime
  has_many :order_items

  def to_a_string
    "#{id} #{date} ITEMS:#{order_items.map { |item| item.menu_item_name }.join("--")} TOTAL PRICE:#{total_price} STATUS:++#{status} #{delivered_at}"
  end

  def order_status
    if status == "being_created"
      "Being created"
    elsif status == "order_confirmed"
      "Order Recived"
    else
      "Delivered at #{delivered_at.strftime("%d %B,%Y - %I:%M %p")}"
    end
  end

  def total_price
    price = 0
    order_items.each { |item| price = price + item.menu_item_price }
    price
  end

  def get_order_item_id(menu_item_id)
    order_items.where(menu_item_id: menu_item_id).first.id
  end
end
