class AddCiudadProvinciasNacionUsers < ActiveRecord::Migration
  def up
    add_column :users, :pais_id, :integer
    add_column :users, :provincia_id, :integer
    add_column :users, :municipio_id, :integer
  end

  def down
    remove_column :users, :pais_id
  	remove_column :users, :provincia_id
    remove_column :users, :municipio_id
  end
end
