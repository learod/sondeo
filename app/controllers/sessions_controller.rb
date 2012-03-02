# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  layout 'sinsession'

  # render new.rhtml
  def new
  end

  def iniciar
    user = User.authenticate(params[:login], params[:password])
    #logger.info("#{user.login}")
    respond_to do |format|
      if user
        self.current_user = user
        #format.json{ render :json => user.to_json }
        format.json{ render :json => { :status => "SUCCESS",  :message=> "Login Successful", :user => "#{user.id}", :usuario => user ,:ciudadano=>user.ciudadano  }.to_json}
        format.xml{ render :xml => {:login => [ :status => "SUCCESS",  :message=> "Bienvenido", :user => "#{user.id}", :usuario => user  ] }.to_xml}
      else
        format.json{ render :json => {:status => "ERROR",  :message=> "Error de usuario o contraseña"}.to_json}
        format.xml{ render :xml => {:login => [ :status => "ERROR",  :message=> "Error de usuario o contraseña" ] }.to_xml}
      end
    end

  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    respond_to do |format|
      if user
        # Protects against session fixation attacks, causes request forgery
        # protection if user resubmits an earlier form using back
        # button. Uncomment if you understand the tradeoffs.
        # reset_session
        flash[:notice] = "Bienvenido #{user.name}"
        self.current_user = user
        new_cookie_flag = (params[:remember_me] == "1")
        handle_remember_cookie! new_cookie_flag
        #redirect_back_or_default('/')
        format.html{redirect_back_or_default('/')}
        format.json{ render :json => user.to_json }
        format.xml{ render :xml => user.to_xml }
      else
        note_failed_signin
        @login       = params[:login]
        @remember_me = params[:remember_me]
        format.html{ render :action => 'new'}
        format.json{ render :json => user.errors.to_json , :status => 400}
        format.xml{ render :xml => user.errors.to_xml , :status => 400}
      end
    end
  end

  def destroy
    logout_killing_session!
    redirect_back_or_default('/', :notice => "You have been logged out.")
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash.now[:error] = "No puede Iniciar Session como '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
