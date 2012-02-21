class PropuestasController < ApplicationController
  # GET /propuestas
  # GET /propuestas.json
  def index
    @propuestas = Propuesta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @propuestas }
    end
  end

  # GET /propuestas/1
  # GET /propuestas/1.json
  def show
    @propuesta = Propuesta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @propuesta }
    end
  end

  # GET /propuestas/new
  # GET /propuestas/new.json
  def new
    @propuesta = Propuesta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @propuesta }
    end
  end

  # GET /propuestas/1/edit
  def edit
    @propuesta = Propuesta.find(params[:id])
  end

  # POST /propuestas
  # POST /propuestas.json
  def create
    @propuesta = Propuesta.new(params[:propuesta])

    respond_to do |format|
      if @propuesta.save
        format.html { redirect_to @propuesta, :notice => 'Propuesta fue creado correctamente.' }
        format.json { render :json => @propuesta, :status => :created, :location => @propuesta }
      else
        format.html { render :action => "new" }
        format.json { render :json => @propuesta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /propuestas/1
  # PUT /propuestas/1.json
  def update
    @propuesta = Propuesta.find(params[:id])

    respond_to do |format|
      if @propuesta.update_attributes(params[:propuesta])
        format.html { redirect_to @propuesta, :notice => 'Propuesta fue actualizado correctamente.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @propuesta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /propuestas/1
  # DELETE /propuestas/1.json
  def destroy
    @propuesta = Propuesta.find(params[:id])
    @propuesta.destroy

    respond_to do |format|
      format.html { redirect_to propuestas_url }
      format.json { head :ok }
    end
  end
end
