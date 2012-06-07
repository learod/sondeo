class Propuesta < ActiveRecord::Base
	belongs_to :periodo_propuesta
	validates :descripcion, :presence => true
end
