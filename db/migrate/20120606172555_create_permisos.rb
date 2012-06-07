class CreatePermisos < ActiveRecord::Migration
  def change
    create_table :permisos do |t|
      t.string :tipo_usuario
      t.string :url

      t.timestamps
    end
  end
end
