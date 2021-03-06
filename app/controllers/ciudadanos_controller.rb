class CiudadanosController < ApplicationController
  before_filter :login_required, :except=>[:periodos,:registrar_voto]
  skip_before_filter :check_authorization, :only => [:busca_barrios]
  #skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  # GET /ciudadanos
  # GET /ciudadanos.json
  def index
    @ciudadanos = Ciudadano.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ciudadanos }
    end
  end

  # GET /ciudadanos/1
  # GET /ciudadanos/1.json
  def show
    @ciudadano = Ciudadano.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ciudadano }
    end
  end

  # GET /ciudadanos/new
  # GET /ciudadanos/new.json
  def new
    @ciudadano = Ciudadano.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ciudadano }
    end
  end

  # GET /ciudadanos/1/edit
  def edit
    @ciudadano = Ciudadano.find(params[:id])
  end

  # POST /ciudadanos
  # POST /ciudadanos.json
  def create
    password = generar_clave
    params[:ciudadano][:barrio_id] = nil if params[:ciudadano][:barrio_id].to_i == 0 
    @ciudadano = Ciudadano.new(params[:ciudadano])
    @ciudadano.password=password
    @usuario = User.new(
                      :name=>@ciudadano.apellido+" "+@ciudadano.nombre,
                      :login=>@ciudadano.dni,
                      :email=>@ciudadano.email,
                      :password=>password,
                      :password_confirmation=>password
                      )
    @usuario.tipo="ciudadano"
    @usuario.save
    @ciudadano.user_id = @usuario.id
    respond_to do |format|
      if @ciudadano.save 
        format.html { redirect_to @ciudadano, :notice => 'Ciudadano ha sido creado.' }
        format.json { render :json => @ciudadano, :status => :created, :location => @ciudadano }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ciudadano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ciudadanos/1
  # PUT /ciudadanos/1.json
  def update
    @ciudadano = Ciudadano.find(params[:id])
    params[:ciudadano][:barrio_id] = nil if params[:ciudadano][:barrio_id].to_i == 0 
    respond_to do |format|
      if @ciudadano.update_attributes(params[:ciudadano])
        format.html { redirect_to @ciudadano, :notice => 'Ciudadano ha sido actualizado.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ciudadano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudadanos/1
  # DELETE /ciudadanos/1.json
  def destroy
    @ciudadano = Ciudadano.find(params[:id])
    @ciudadano.destroy

    respond_to do |format|
      format.html { redirect_to ciudadanos_url }
      format.json { head :ok }
    end
  end


  def busca_barrios
    unless params[:id] == 'Seleccione'
      @barrios = Barrio.where("municipio_id = ?", params[:id])
    else
      @barrios = []
    end 
    respond_to do |format|
      format.js
    end
  end


  def periodos
    ciudadano=Ciudadano.find(params[:id])
    respond_to do |format|
      format.json{render :json => ciudadano.periodos_abiertos.to_json }
    end
  end

  def elecciones_cerradas
    ciudadano=Ciudadano.find(params[:id])
    respond_to do |format|
      format.json{render :json => ciudadano.elecciones_cerradas.to_json }
    end
  end

  def anteproyectos
    @ciudadano=Ciudadano.find(params[:id])
    @periodo_electoral=@ciudadano.eleccion_abierta
    @anteproyectos = @periodo_electoral ? @periodo_electoral.anteproyectos_ciudadano(@ciudadano.id) : nil

    respond_to do |format|
      format.html
      format.json{render :json => @anteproyectos.to_json }
    end
  end

  def registrar_voto
    @ciudadano=Ciudadano.find(params[:id])
    @eleccion=Eleccion.where("anteproyecto_id = ? and ciudadano_id = ? ",params[:proyecto_id],@ciudadano.id).first
    @eleccion=Eleccion.new(:anteproyecto_id=>params[:proyecto_id],:ciudadano_id=>@ciudadano.id) if @eleccion.blank?
    unless params[:etiqueta] == "null"
      @eleccion.etiqueta = params[:etiqueta]
      @eleccion.save
    else
      @eleccion.delete
    end
    respond_to do |format|
      format.js
      format.json{render :json=> @eleccion.to_json,:status=>'ok'}
    end
  end
end
