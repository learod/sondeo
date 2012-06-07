config_file = File.read(RAILS_ROOT + "/config/etiquetas.yml")
ETIQUETAS = YAML.load(config_file)

