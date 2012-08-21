class Media
  
  attr_reader :resultados
  
  def initialize(periodo_electoral)
    res=[]
    periodo_electoral.anteproyectos.each{|a| res << [a.id,a.media]}
    @resultados = Hash[res]
  end

end