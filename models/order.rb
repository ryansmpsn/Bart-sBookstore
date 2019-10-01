class Order < ApplicationRecord
	has_many :order_items
	has_many :books, through: :order_items
	
	before_create :set_orderDate_to_now
  	def set_orderDate_to_now
    self.orderDate = Time.now
  	end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.bookQuantity * oi.unit_price) : 0 }.sum
  end

end
