#coding: utf-8
# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  layout 'sinsession'

  # render new.rhtml
  def new
    logger.info(" AGENTE  =  #{request.user_agent}")
    if request.user_agent =~ /Mobile|webOS|SymbianOS/
      redirect_to "/mobile"
    end
  end

  def iniciar
    #params[:password]=Ciudadano.find(3).password
    logger.info "#{params[:password]}"
    user = User.authenticate(params[:login], params[:password])
    # @user = User.all
    #logger.info("#{user.login}")

    respond_to do |format|
      if user && user.ciudadano
        self.current_user = user
        logger.info("#{user.ciudadano.to_json}")
        # format.json {render :json => @user }
        format.json{ render :json => { :status => "SUCCESS",  :message=> "Bienvenido", :user => "#{user.id}", :usuario => user ,:ciudadano=>user.ciudadano.as_json(:methods=>[:barrio_nombre,:municipio_nombre])}.to_json}
      else
        format.json{ render :json => {:status => "ERROR",  :message=> "Error de usuario o password"}.to_json.html_safe}
      end
    end

  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    logger.info "PASO"
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
        format.json{ render :json =>  {:status => 400}.to_json }
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
