class CreateAnteproyectos < ActiveRecord::Migration
  def change
    create_table :anteproyectos do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :periodo_electoral_id

      t.timestamps
    end
  end
end
