class CreateCiudadanos < ActiveRecord::Migration
  def change
    create_table :ciudadanos do |t|
      t.string :dni
      t.string :nombre
      t.string :apellido
      t.string :clave
      t.string :email
      t.string :telefono
      t.string :direccion
      t.integer :barrio_id

      t.timestamps
    end
  end
end
