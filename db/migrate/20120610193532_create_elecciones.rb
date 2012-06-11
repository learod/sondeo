class CreateElecciones < ActiveRecord::Migration
  def change
    create_table :elecciones do |t|
      t.integer :ciudadano_id
      t.integer :anteproyecto_id
      t.integer :etiqueta

      t.timestamps
    end
  end
end
