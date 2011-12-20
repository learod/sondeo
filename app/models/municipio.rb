class Municipio < ActiveRecord::Base
	has_many :barrios

	validates :nombre, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 3..40 }

end
