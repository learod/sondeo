class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :periodo_consenso_id

      t.timestamps
    end
  end
end
