class Pais < ActiveRecord::Base
	has_many :provincias
	has_many :municipios, :through => :provincias

	validates :nombre, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 3..40 }
end
