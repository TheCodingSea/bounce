class Charge < ActiveRecord::Base
  belongs_to :customer
  belongs_to :sale

end
