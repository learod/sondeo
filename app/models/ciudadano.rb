class Ciudadano < ActiveRecord::Base
  belongs_to :barrio
  belongs_to :user	
  has_many :elecciones
  # has_many :anteproyectos,:through => :elecciones

  validates :nombre, :apellido, :email, :dni, :direccion, :telefono, :barrio_id,:user_id, :presence => true
  validates :dni, :telefono, :numericality => true
  validates_uniqueness_of :dni
  
  delegate :nombre, :to => :barrio, :prefix => true

  def municipio_nombre
    barrio.municipio_nombre
  end

  def periodos_abiertos
  	barrio.periodo_propuestas.where("? <= fecha_fin",Date.today)
  end

  def eleccion_abierta
  	barrio.periodo_electorales.where("? <= fecha_fin",Date.today).first
  end

  def elecciones_cerradas
    barrio.periodo_electorales.where("? > fecha_fin",Date.today)
  end

  def alternativas(periodo_electoral)
    Hash[elecciones.includes(:anteproyecto).where('anteproyectos.periodo_electoral_id = ?',periodo_electoral.id).collect{|v| [v.anteproyecto_id,v.etiqueta]}]
  end
  
end
