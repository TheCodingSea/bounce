class RentalLocation < ActiveRecord::Base
  belongs_to :sale
  validates :first_name, :last_name, :address_1, :city, :state, :zip, :phone, presence: true
end
