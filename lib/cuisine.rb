class Cuisine < ActiveRecord::Base
  has_many(:restaurants)
  has_many(:users)
  validates(:name, :presence=>true)
end
