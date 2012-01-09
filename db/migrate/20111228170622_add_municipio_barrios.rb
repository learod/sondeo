class AddMunicipioBarrios < ActiveRecord::Migration
  def up
    
    add_column :barrios, :municipio_id, :integer
    
  end

  def down
    remove_column :barrios, :municipio_id
  end
end
