class AddPasswordCiudadanos < ActiveRecord::Migration
  def self.up
  	add_column :ciudadanos, :user_id, :integer
  	add_column :ciudadanos, :password, :string
  end

  def self.down
  	remove_column :ciudadanos, :user_id
  	remove_column :ciudadanos, :password
  end
end
