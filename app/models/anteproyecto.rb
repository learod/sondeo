class Anteproyecto < ActiveRecord::Base
	has_many  :elecciones
	has_many  :ciudadanos, :through => :elecciones

	validates :descripcion, :nombre, :presence => true
end
