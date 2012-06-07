class Anteproyecto < ActiveRecord::Base
	validates :descripcion, :nombre, :presence => true
end
