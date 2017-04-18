class Budget < ActiveRecord::Base
  has_many(:restaurants)
  has_many(:users)
  validates(:scale, :presence=>true)
end
