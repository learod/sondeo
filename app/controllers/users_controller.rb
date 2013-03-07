class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    #logout_keeping_session!
    # raise ""
    logger.info("ERROR .. ......................  ------ #{params[:user][:tipo]}")
    @user = User.new(params[:user])
    @user.tipo = params[:user][:tipo]
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_user = @user # !! now logged in
      redirect_back_or_default(new_user_path, :notice => "Usuario Creado.") 
    else
      flash.now[:error]  = "Lo sentimos, No hemos podido crear el Usuario, Por favor vuelva a intentarlo."
      render :action => 'new'
    end
  end

  def index
    @usuarios = User.paginate(:page => params[:page], :per_page => 8,:order=>'name')
    respond_to do |format|
      format.html
    end
  end

  def cambiar_pass
    user = User.authenticate(params[:login], params[:password])
    ci = user.ciudadano
    valido=false
    if user && user.id == params[:id].to_i
      user.password = params[:n_pass] 
      user.password_confirmation = params[:cn_pass] 
      ci.password = params[:cn_pass]
      valido = true
    end
    respond_to do |format|
      if valido && user.save && ci.save
        format.json{render :json=>{:status => 'ok',:message =>'Hecho!!!'}.to_json}
      else
        format.json{render :json=>{:status => 'ERROR',:message =>'error'}.to_json}        
      end
    end
  end

end
