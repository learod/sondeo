class PeriodoPropuesta < ActiveRecord::Base
  belongs_to :barrio
  belongs_to :municipio

  has_many :propuestas

  #delegate :nombre, :to => :barrio, :prefix => 'barrio'
  delegate :nombre, :to => :municipio, :prefix => 'municipio'
  delegate :pais, :to => :municipio
  delegate :provincia, :to => :municipio 

  def barrio_nombre
    barrio.nombre unless barrio.blank? 
  end

  def provincia_id
    provincia.id
  end

  def pais_id
    pais.id    
  end

  def pais_nombre
    municipio.pais_nombre
  end

  def provincia_nombre
    municipio.provincia_nombre
  end
end
