class Invoice < ApplicationRecord
		belongs_to :user
		belongs_to :order

		before_create :set_invoiceDate_to_now
  		def set_invoiceDate_to_now
    		self.invoiceDate = Time.now
  		end
end
