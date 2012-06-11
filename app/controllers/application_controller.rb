class ApplicationController < ActionController::Base
  require 'authenticated_system'
  include AuthenticatedSystem
  protect_from_forgery
  
  before_filter :session_expiry, :except => [:login, :logout]
  before_filter :update_activity_time, :except => [:login, :logout]
  #before_filter :check_authorization

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


  def check_authorization

       usuario = current_user

       cargar_urls unless session[:urls] and !usuario.blank?

       unless controller_name == "main" || controller_name == "sessions"

         if usuario
           unless session[:urls].empty?
              unless session[:urls].detect{|m| m.include?(controller_name)}
                flash[:notice] = "Ud. no tiene los permisos suficientes para acceder a esta Area"
                redirect_to '/' and return
                return false
              end
           else
              flash[:notice] = "Ud. no tiene los asignado roles dentro del sistema."
              redirect_to '/' and return
              return false
           end
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

  protected

  def cargar_urls
    session[:urls] = current_user.permisos.map{|r| r.url }.uniq if current_user
    # session[:urls] = current_user.permisos{|r| r.url }.flatten.collect{|m| m.url}.uniq if current_user
  end
end
