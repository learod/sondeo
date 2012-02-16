class Municipio < ActiveRecord::Base
  has_many :barrios
  belongs_to :provincia
  

  validates :nombre, :presence   => true,
                    :uniqueness => {:scope => :provincia_id},
                    :length     => { :within => 3..40 }
  validates :provincia_id, :presence => true
  
  delegate :nombre, :to => :provincia, :prefix=>'provincia'
  
  def pais
    provincia.pais
  end

  def pais_nombre
    pais.nombre
  end

end
