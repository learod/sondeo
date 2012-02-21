class ApplicationController < ActionController::Base
  require 'authenticated_system'
  include AuthenticatedSystem
  protect_from_forgery
  
  before_filter :session_expiry, :except => [:login, :logout]
  before_filter :update_activity_time, :except => [:login, :logout]

  def session_expiry
    unless session[:expires_at].nil?
      @time_left = (session[:expires_at] - Time.now).to_i
      unless @time_left > 0 
        logout_killing_session!
        #flash[:error] = 'La session ha expirado.'
        redirect_to login_url
      end 
    end 
  end 

  def update_activity_time
    session[:expires_at] = 100.minutes.from_now
  end

  def generar_clave
    o =  [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten;  
    string  =  (0..8).map{ o[rand(o.length)]  }.join;
  end
end
