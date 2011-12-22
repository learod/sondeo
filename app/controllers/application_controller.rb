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
        flash[:error] = 'La session ha expirado.'
        redirect_to login_url
      end 
    end 
  end 

  def update_activity_time
    session[:expires_at] = 5.minutes.from_now
  end
end
