class Eleccion < ActiveRecord::Base
  belongs_to :ciudadano
  belongs_to :anteproyecto

  def valor
    ETIQUETAS[self.etiqueta]["valor"]
  end
end
