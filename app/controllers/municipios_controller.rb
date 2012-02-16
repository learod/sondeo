class MunicipiosController < ApplicationController
  before_filter :login_required
  # GET /municipios
  # GET /municipios.json
  def index
    @municipios = Municipio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @municipios }
    end
  end

  # GET /municipios/1
  # GET /municipios/1.json
  def show
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @municipio }
    end
  end

  # GET /municipios/new
  # GET /municipios/new.json
  def new
    @municipio = Municipio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @municipio }
    end
  end

  # GET /municipios/1/edit
  def edit
    @municipio = Municipio.find(params[:id])
  end

  # POST /municipios
  # POST /municipios.json
  def create
    @municipio = Municipio.new(params[:municipio])

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to @municipio, :notice => 'Municipio was successfully created.' }
        format.json { render :json => @municipio, :status => :created, :location => @municipio }
      else
        format.html { render :action => "new" }
        format.json { render :json => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /municipios/1
  # PUT /municipios/1.json
  def update
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      if @municipio.update_attributes(params[:municipio])
        format.html { redirect_to @municipio, :notice => 'Municipio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.json
  def destroy
    @municipio = Municipio.find(params[:id])
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to municipios_url }
      format.json { head :ok }
    end
  end

  def busca_provincias
    unless params[:id] == 'Seleccione'
      @provincias = Provincia.where("pais_id = ?", params[:id])
    else
      @provincias = []
    end 
    respond_to do |format|
      format.js
    end
  end
end
