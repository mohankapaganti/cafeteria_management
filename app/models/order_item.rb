class OrderItem < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems order_id:integer menu_item_id:integer menu_item_name:string menu_item_price:integer
  belongs_to :order
  belongs_to :menu_item

  def to_a_string
    "#{id} #{order_id} #{menu_item_id} #{menu_item_name} #{menu_item_price}"
  end

  def self.get_order_item(menu_item_id)
    where("menu_item_id = ?", menu_item_id)
  end

  def self.get_menu_item_price(menu_item_name)
    find_by(menu_item_name: menu_item_name).menu_item_price
  end
end
