class Barrio < ActiveRecord::Base
  has_many :ciudadanos
  
  validates :nombre, :presence => true, :uniqueness => true
  
end
