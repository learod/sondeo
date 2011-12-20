class CreateProvincias < ActiveRecord::Migration
  def change
    create_table :provincias do |t|
      t.string :nombre
      t.integer :pais_id

      t.timestamps
    end
  end
end
