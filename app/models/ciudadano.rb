class Ciudadano < ActiveRecord::Base
  belongs_to :barrio
  belongs_to :user	
  has_many :elecciones
  has_many :anteproyectos,:through => :elecciones

  validates :nombre, :apellido, :email, :dni, :direccion, :telefono, :barrio_id,:user_id, :presence => true
  validates :dni, :telefono, :numericality => true
  validates_uniqueness_of :dni
  
  delegate :nombre, :to => :barrio, :prefix => true

  def periodos_abiertos
  	barrio.periodo_propuestas.where("? <= fecha_fin",Date.today)
  end

  def eleccion_abierta
  	barrio.periodo_electorales.where("? <= fecha_fin",Date.today).first
  end

  def alternativas
    h={}
    elecciones.includes(:anteproyecto).where('anteproyectos.periodo_electoral_id = ?',2).collect{|v| h[v.anteproyecto_id]=v.etiqueta}
    h
    # ActiveRecord::Base.connection.execute "select a.id, e.etiqueta from elecciones as e, anteproyectos as a where e.ciudadano_id = #{self.id} and a.id = e.anteproyecto_id"
  end
  
end
