class Propuesta < ActiveRecord::Base
	belongs_to :user
	belongs_to :periodo_propuesta

	validates :descripcion, :presence => true
end
