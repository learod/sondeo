class PeriodoConsensosController < ApplicationController
  # GET /periodo_consensos
  # GET /periodo_consensos.json
  def index
    @periodo_consensos = PeriodoConsenso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @periodo_consensos }
    end
  end

  # GET /periodo_consensos/1
  # GET /periodo_consensos/1.json
  def show
    @periodo_consenso = PeriodoConsenso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @periodo_consenso }
    end
  end

  # GET /periodo_consensos/new
  # GET /periodo_consensos/new.json
  def new
    @periodo_consenso = PeriodoConsenso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @periodo_consenso }
    end
  end

  # GET /periodo_consensos/1/edit
  def edit
    @periodo_consenso = PeriodoConsenso.find(params[:id])
  end

  # POST /periodo_consensos
  # POST /periodo_consensos.json
  def create
    params[:periodo_consenso][:fecha_fin]=Date.strptime(params[:periodo_consenso][:fecha_fin],'%d/%m/%Y')
    params[:periodo_consenso][:fecha_inicio]=Date.strptime(params[:periodo_consenso][:fecha_inicio],'%d/%m/%Y')
    @periodo_consenso = PeriodoConsenso.new(params[:periodo_consenso])

    respond_to do |format|
      if @periodo_consenso.save
        format.html { redirect_to @periodo_consenso, :notice => 'Periodo consenso creado correctamente.' }
        format.json { render :json => @periodo_consenso, :status => :created, :location => @periodo_consenso }
      else
        format.html { render :action => "new" }
        format.json { render :json => @periodo_consenso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodo_consensos/1
  # PUT /periodo_consensos/1.json
  def update
    @periodo_consenso = PeriodoConsenso.find(params[:id])
    params[:periodo_consenso][:fecha_inicio]=Date.strptime(params[:periodo_consenso][:fecha_inicio],'%d/%m/%Y') unless params[:periodo_consenso][:fecha_inicio].blank?
    params[:periodo_consenso][:fecha_fin]=Date.strptime(params[:periodo_consenso][:fecha_fin],'%d/%m/%Y') unless params[:periodo_consenso][:fecha_fin].blank?
    
    respond_to do |format|
      if @periodo_consenso.update_attributes(params[:periodo_consenso])
        format.html { redirect_to @periodo_consenso, :notice => 'Periodo consenso editado correctamente.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @periodo_consenso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periodo_consensos/1
  # DELETE /periodo_consensos/1.json
  def destroy
    @periodo_consenso = PeriodoConsenso.find(params[:id])
    @periodo_consenso.destroy

    respond_to do |format|
      format.html { redirect_to periodo_consensos_url }
      format.json { head :ok }
    end
  end


  def show_proyecto
    @periodo_consenso = PeriodoConsenso.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @periodo_consenso }
    end
  end

  def nuevo_proyecto
    @periodo_consenso = PeriodoConsenso.find(params[:id])
    params[:proyecto][:periodo_consenso_id]=@periodo_consenso.id
    @proyecto=Proyecto.create(params[:proyecto])
    respond_to do |format|
      format.js # show.html.erb
      #format.json { render :json => @periodo_consenso }
    end
  end
  
  def eliminar_proyecto
    @id=params[:id]
    @proyecto=Proyecto.find(params[:id])
    @proyecto.delete
    respond_to do |format|
      format.js # show.html.erb
      #format.json { render :json => @periodo_consenso }
    end
  end

end
