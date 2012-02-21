class CreatePeriodoPropuestas < ActiveRecord::Migration
  def change
    create_table :periodo_propuestas do |t|
      t.string :descripcion
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :barrio_id
      t.integer :municipio_id

      t.timestamps
    end
  end
end
