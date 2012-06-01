class PeriodoElectoral < ActiveRecord::Base
  belongs_to :barrio

  has_many :anteproyectos

  delegate :nombre, :to => :municipio, :prefix => 'municipio'
  delegate :pais, :to => :municipio
  delegate :provincia, :to => :municipio 
  delegate :municipio, :to => :barrio

  validates :descripcion, :barrio_id,:fecha_fin,:fecha_inicio, :presence => true

  def barrio_nombre
    barrio.nombre unless barrio.blank? 
  end

  def municipio_id
    municipio.id
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
