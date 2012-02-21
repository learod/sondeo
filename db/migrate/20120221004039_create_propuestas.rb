class CreatePropuestas < ActiveRecord::Migration
  def change
    create_table :propuestas do |t|
      t.text :descripcion
      t.integer :user_id
      t.integer :periodo_consulta_propuesta_id

      t.timestamps
    end
  end
end
