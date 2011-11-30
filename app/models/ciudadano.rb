class Ciudadano < ActiveRecord::Base
  belongs_to :barrio

  validates :nombre, :apellido, :email, :dni, :direccion, :telefono, :barrio_id, :presence => true
  validates :dni, :telefono, :numericality => true
  
  delegate :nombre, :to => :barrio, :prefix => true
  
end
