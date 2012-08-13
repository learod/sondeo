class PeriodoElectoral < ActiveRecord::Base
  belongs_to :barrio

  has_many :anteproyectos
  # has_many :ciudadanos, :through => :anteproyectos

  delegate :nombre, :to => :municipio, :prefix => 'municipio'
  delegate :pais, :to => :municipio
  delegate :provincia, :to => :municipio 
  delegate :municipio, :to => :barrio
  delegate :ciudadanos, :to => :barrio , :prefix=>true

  validates :descripcion, :barrio_id,:fecha_fin,:fecha_inicio, :presence => true

  def ciudadanos
    anteproyectos.map{|a| a.ciudadanos}.flatten.uniq
  end

  def agrupacion
    Hash[ciudadanos.group_by{|c| c.alternativas(self)}.map{|kv| [kv[0],kv[1].size]}]
  end

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
