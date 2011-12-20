class Provincia < ActiveRecord::Base
	belongs_to :pais

	has_many :municipios

	validates :nombre, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 3..40 }
        
    validates :pais_id, :presence => true
                    
end
