class Restaurant < ActiveRecord::Base
  belongs_to(:cuisine)
  belongs_to(:district)
  belongs_to(:budget)
  has_many(:matches)
end
