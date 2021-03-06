class Wckowa

  attr_reader :comites, :cant_comites,:resultados, :nombre_proyectos
  def initialize(periodo_electoral)
    agrupacion = periodo_electoral.agrupacion
    @cant_comites = agrupacion.max_by{|x,v| v}[1]
    generar_comites(agrupacion)
    genera_resultados(periodo_electoral)
  end



private
  # agrupa y genera los comite para luego realizar el analisis
  def generar_comites(agrupacion)
    @comites = []
    @cant_comites.times do 
      comite=[]
      agrupacion.each do |k,v|
        if agrupacion[k] > 0
          comite << k 
          agrupacion[k]= agrupacion[k] -1
        end
      end
      @comites << comite
    end
  end

  def genera_resultados(periodo_electoral)
    @resultados={}
    @nombre_proyectos={}
    periodo_electoral.anteproyectos.each do |a|
      valor = 0
      @comites.each do |comite|
        #puts "1 paso -- cont = #{comite.count}"
        peso_comite = 1.0 / (comite.count * @cant_comites)
        comite.each do |ciudadano|
         # puts "2 -- paso ciu = #{ciudadano[a.id]} -- pon = #{peso_comite} -- cant = #{@cant_comites} "
          valor = valor + peso_comite * ciudadano[a.id].to_i
        end
      end
      @resultados[a.id]=valor
      @nombre_proyectos[a.id]=a.nombre
    end
  end

end

#  agrupacion = {
#         {1=>3, 2=>5, 3=>4}=>3, 
#         {1=>5, 2=>5, 3=>5}=>1, 
#         {3=>3, 4=>4}=>2, 
#         {1=>3, 2=>5, 3=>5}=>1
#       } 

# comites = [
#       [{1=>3, 2=>5, 3=>4}, {1=>5, 2=>5, 3=>5}, {3=>3, 4=>4}, {1=>3, 2=>5, 3=>5}], 
#       [{1=>3, 2=>5, 3=>4}, {3=>3, 4=>4}], 
#       [{1=>3, 2=>5, 3=>4}]
#     ] 

# resultados={
#   1=>2.41666666666667, 
#   2=>3.75, 
#   3=>3.91666666666667, 
#   4=>1.0
# }