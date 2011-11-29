class Ciudadano < ActiveRecord::Base
  belongs_to :barrio
  
  validates :nombre, :barrio_id, :presence => true
end
