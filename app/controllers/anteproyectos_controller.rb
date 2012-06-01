class AnteproyectosController < ApplicationController
  # GET /anteproyectos
  # GET /anteproyectos.json
  def index
    @anteproyectos = Anteproyecto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @anteproyectos }
    end
  end

  # GET /anteproyectos/1
  # GET /anteproyectos/1.json
  def show
    @anteproyecto = Anteproyecto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @anteproyecto }
    end
  end

  # GET /anteproyectos/new
  # GET /anteproyectos/new.json
  def new
    @anteproyecto = Anteproyecto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @anteproyecto }
    end
  end

  # GET /anteproyectos/1/edit
  def edit
    @anteproyecto = Anteproyecto.find(params[:id])
  end

  # POST /anteproyectos
  # POST /anteproyectos.json
  def create
    @anteproyecto = Anteproyecto.new(params[:anteproyecto])

    respond_to do |format|
      if @anteproyecto.save
        format.html { redirect_to @anteproyecto, :notice => 'Anteproyecto was successfully created.' }
        format.json { render :json => @anteproyecto, :status => :created, :location => @anteproyecto }
      else
        format.html { render :action => "new" }
        format.json { render :json => @anteproyecto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anteproyectos/1
  # PUT /anteproyectos/1.json
  def update
    @anteproyecto = Anteproyecto.find(params[:id])

    respond_to do |format|
      if @anteproyecto.update_attributes(params[:anteproyecto])
        format.html { redirect_to @anteproyecto, :notice => 'Anteproyecto was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @anteproyecto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /anteproyectos/1
  # DELETE /anteproyectos/1.json
  def destroy
    @anteproyecto = Anteproyecto.find(params[:id])
    @anteproyecto.destroy

    respond_to do |format|
      format.html { redirect_to anteproyectos_url }
      format.json { head :ok }
    end
  end
end
