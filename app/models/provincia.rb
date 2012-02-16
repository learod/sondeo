class Provincia < ActiveRecord::Base
	belongs_to :pais

	has_many :municipios

	delegate :nombre, :to => :pais, :prefix=>true

	validates :nombre, :presence   => true,
                    :uniqueness => {:scope => :pais_id},
                    :length     => { :within => 3..40 }
        
    validates :pais_id, :presence => true
                    
end
