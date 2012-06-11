class Barrio < ActiveRecord::Base
  has_many :ciudadanos
  has_many :periodo_propuestas
  has_many :periodo_electorales,:class_name=>'PeriodoElectoral'

  belongs_to :municipio


  
  validates :nombre, :presence => true, :uniqueness => {:scope => :municipio_id}
  validates :municipio_id, :presence => true

  delegate :nombre, :to => :municipio, :prefix => 'municipio'

  def provincia
  	municipio.provincia
  end

  def provincia_nombre
  	provincia.nombre
  end

  def pais
  	provincia.pais  	
  end

  def pais_nombre
  	pais.nombre
  end
  
end
