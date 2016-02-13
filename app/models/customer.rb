class Customer < ActiveRecord::Base
  has_many :charges
  has_many :sales
end
