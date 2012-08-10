class PeriodoElectoralesController < ApplicationController
  before_filter :login_required
  # GET /periodo_electorales
  # GET /periodo_electorales.json
  def index
    @periodo_electorales = PeriodoElectoral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @periodo_electorales }
    end
  end

  # GET /periodo_electorales/1
  # GET /periodo_electorales/1.json
  def show
    @periodo_electoral = PeriodoElectoral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @periodo_electoral }
    end
  end

  # GET /periodo_electorales/new
  # GET /periodo_electorales/new.json
  def new
    @periodo_electoral = PeriodoElectoral.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @periodo_electoral }
    end
  end

  # GET /periodo_electorales/1/edit
  def edit
    @periodo_electoral = PeriodoElectoral.find(params[:id])
  end

  # POST /periodo_electorales
  # POST /periodo_electorales.json
  def create
    params[:periodo_electoral][:fecha_fin]=Date.strptime(params[:periodo_electoral][:fecha_fin],'%d/%m/%Y')
    params[:periodo_electoral][:fecha_inicio]=Date.strptime(params[:periodo_electoral][:fecha_inicio],'%d/%m/%Y')
    @periodo_electoral = PeriodoElectoral.new(params[:periodo_electoral])

    respond_to do |format|
      if @periodo_electoral.save
        format.html { redirect_to @periodo_electoral, :notice => 'Periodo electoral was successfully created.' }
        format.json { render :json => @periodo_electoral, :status => :created, :location => @periodo_electoral }
      else
        format.html { render :action => "new" }
        format.json { render :json => @periodo_electoral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodo_electorales/1
  # PUT /periodo_electorales/1.json
  def update
    @periodo_electoral = PeriodoElectoral.find(params[:id])
    params[:periodo_electoral][:fecha_inicio]=Date.strptime(params[:periodo_electoral][:fecha_inicio],'%d/%m/%Y') unless params[:periodo_electoral][:fecha_inicio].blank?
    params[:periodo_electoral][:fecha_fin]=Date.strptime(params[:periodo_electoral][:fecha_fin],'%d/%m/%Y') unless params[:periodo_electoral][:fecha_fin].blank?

    respond_to do |format|
      if @periodo_electoral.update_attributes(params[:periodo_electoral])
        format.html { redirect_to @periodo_electoral, :notice => 'Periodo electoral was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @periodo_electoral.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periodo_electorales/1
  # DELETE /periodo_electorales/1.json
  def destroy
    @periodo_electoral = PeriodoElectoral.find(params[:id])
    @periodo_electoral.destroy

    respond_to do |format|
      format.html { redirect_to periodo_electorales_url }
      format.json { head :ok }
    end
  end


  def show_proyecto
    @periodo_electoral = PeriodoElectoral.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @periodo_electoral }
    end
  end

  def nuevo_proyecto
    @periodo_electoral = PeriodoElectoral.find(params[:id])
    params[:anteproyecto][:periodo_electoral_id]=@periodo_electoral.id
    @anteproyecto=Anteproyecto.new(params[:anteproyecto])
    @anteproyecto.save
    respond_to do |format|
      format.js # show.html.erb
      #format.json { render :json => @periodo_electoral }
    end
  end
  
  def nuevo_anteproyecto
    @periodo_electoral = PeriodoElectoral.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
      #format.json { render :json => @periodo_electoral }
    end
  end
  
  def eliminar_proyecto
    @id=params[:id]
    @anteproyecto=Anteproyecto.find(params[:id])
    @anteproyecto.delete
    respond_to do |format|
      format.js # show.html.erb
      #format.json { render :json => @periodo_electoral }
    end
  end

  def resultado
    @periodo_electoral = PeriodoElectoral.find(params[:id])
    @periodo_electoral.ciudadanos

    respond_to do |format|
      format.html
    end
  end
end
