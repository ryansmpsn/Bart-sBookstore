class Book < ApplicationRecord
  has_attached_file :cover, styles: { medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

	has_many :order_items
	has_many :orders, through: :order_items
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :publishers
end
