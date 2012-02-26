class PeriodoPropuesta < ActiveRecord::Base
  belongs_to :barrio
  belongs_to :municipio

  delegate :nombre, :to => :barrio, :prefix => 'barrio'
  delegate :nombre, :to => :municipio, :prefix => 'municipio'

  def pais_nombre
    municipio.pais_nombre
  end
  def provincia_nombre
    municipio.provincia_nombre
  end
end
