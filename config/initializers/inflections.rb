# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'error', 'errores'
   inflect.irregular 'ciudadano', 'ciudadanos'
   inflect.irregular 'barrio', 'barrios'
   inflect.irregular 'pais', 'paises'
   inflect.irregular 'provincia', 'provincias'
   inflect.irregular 'municipio', 'municipios'
   inflect.irregular 'periodo_propuesta', 'periodo_propuestas'
   inflect.irregular 'propuesta', 'propuestas'
#   inflect.uncountable %w( fish sheep )
 end
