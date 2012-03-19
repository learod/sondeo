class PeriodoPropuestasController < ApplicationController
  # GET /periodo_propuestas
  # GET /periodo_propuestas.json
  def index
    @periodo_propuestas = PeriodoPropuesta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @periodo_propuestas }
    end
  end

  # GET /periodo_propuestas/1
  # GET /periodo_propuestas/1.json
  def show
    @periodo_propuesta = PeriodoPropuesta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @periodo_propuesta }
    end
  end

  # GET /periodo_propuestas/new
  # GET /periodo_propuestas/new.json
  def new
    @periodo_propuesta = PeriodoPropuesta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @periodo_propuesta }
    end
  end

  # GET /periodo_propuestas/1/edit
  def edit
    @periodo_propuesta = PeriodoPropuesta.find(params[:id])
  end

  # POST /periodo_propuestas
  # POST /periodo_propuestas.json
  def create
    params[:periodo_propuesta][:fecha_fin]=Date.strptime(params[:periodo_propuesta][:fecha_fin],'%d/%m/%Y')
    params[:periodo_propuesta][:fecha_inicio]=Date.strptime(params[:periodo_propuesta][:fecha_inicio],'%d/%m/%Y')
    @periodo_propuesta = PeriodoPropuesta.new(params[:periodo_propuesta])

    respond_to do |format|
      if @periodo_propuesta.save
        format.html { redirect_to @periodo_propuesta, :notice => 'Periodo propuesta fue creado correctamente.' }
        format.json { render :json => @periodo_propuesta, :status => :created, :location => @periodo_propuesta }
      else
        format.html { render :action => "new" }
        format.json { render :json => @periodo_propuesta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodo_propuestas/1
  # PUT /periodo_propuestas/1.json
  def update
    @periodo_propuesta = PeriodoPropuesta.find(params[:id])
    params[:periodo_propuesta][:fecha_inicio]=Date.strptime(params[:periodo_propuesta][:fecha_inicio],'%d/%m/%Y') unless params[:periodo_propuesta][:fecha_inicio].blank?
    params[:periodo_propuesta][:fecha_fin]=Date.strptime(params[:periodo_propuesta][:fecha_fin],'%d/%m/%Y') unless params[:periodo_propuesta][:fecha_fin].blank?
    respond_to do |format|
      if @periodo_propuesta.update_attributes(params[:periodo_propuesta])
        format.html { redirect_to @periodo_propuesta, :notice => 'Periodo propuesta fue actualizado correctamente.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @periodo_propuesta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periodo_propuestas/1
  # DELETE /periodo_propuestas/1.json
  def destroy
    @periodo_propuesta = PeriodoPropuesta.find(params[:id])
    @periodo_propuesta.destroy

    respond_to do |format|
      format.html { redirect_to periodo_propuestas_url }
      format.json { head :ok }
    end
  end

  def propuestas
    @periodo_propuesta = PeriodoPropuesta.find(params[:id])
    @propuestas = @periodo_propuesta.propuestas
    respond_to do |format|
      format.html
      format.json{render :json => @propuestas.to_json}
    end
  end
  def nueva_propuesta
    @propuesta=Propuesta.new
    @periodo_propuesta = PeriodoPropuesta.find(params[:id])
    #@propuestas = @periodo_propuesta.propuestas
    respond_to do |format|
      format.html
      #format.json{render :json => @propuestas.to_json}
    end
  end

end
