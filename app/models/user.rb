require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  set_table_name 'users'

  has_one :ciudadano

  has_many :permisos, :finder_sql => proc { "SELECT * FROM permisos WHERE tipo_usuario like '#{self.tipo}'" }


  validates :login, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 3..40 },
                    :format     => { :with => Authentication.login_regex, :message => Authentication.bad_login_message }

  validates :name,  :presence   => true,
                    :length     => { :maximum => 100 },
                    :allow_nil  => false

  validates :email, :presence   => true,
                    :uniqueness => true,
                    :format     => { :with => Authentication.email_regex, :message => Authentication.bad_email_message },
                    :length     => { :within => 6..100 }

  validates :tipo,  :presence      => true,
                    :format        => {:with => /\Aadministrador\z|\Aprovincia\z|\Amunicipio\z|\Aciudadano\z/, 
                                       :message    => 'Error en tipo. (Seleccione uno)',:on => :create}
  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation,:nombre

  delegate :nombre, :to => :ciudadano, :prefix=>true, :allow_nil=>true
  
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def nombre=(value)
    name=value
  end

  def nombre
    name
  end

  def administrador?  
    tipo == 'administrador'
  end

  def ciudadano?  
    tipo == 'ciudadano'
  end

  def gobierno?  
    %w(provincia municipio).include?(tipo)
  end

  def adm_gob?
    administrador? || gobierno?
  end

  def barrio_id
    if ciudadano
      ciudadano.barrio_id
    end
  end


  protected
    


end
