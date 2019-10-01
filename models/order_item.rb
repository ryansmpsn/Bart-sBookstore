class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :book

  validates :bookQuantity, presence: true, numericality: { only_integer: true, greater_than: 0 }


  def unit_price
     book.price
  end

  def total_price
    unit_price * bookQuantity
  end

end