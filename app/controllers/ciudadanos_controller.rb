class CiudadanosController < ApplicationController
  before_filter :login_required
  # GET /ciudadanos
  # GET /ciudadanos.json
  def index
    @ciudadanos = Ciudadano.all

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
    @ciudadano = Ciudadano.new(params[:ciudadano])
    #@ciudadano.pais_id = current_user.pais_id
    #@ciudadano.provinvia_id = current_user.provinvia_id

    respond_to do |format|
      if @ciudadano.save
        format.html { redirect_to @ciudadano, :notice => 'Ciudadano was successfully created.' }
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

    respond_to do |format|
      if @ciudadano.update_attributes(params[:ciudadano])
        format.html { redirect_to @ciudadano, :notice => 'Ciudadano was successfully updated.' }
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
end
