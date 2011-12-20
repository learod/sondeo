class ProvinciasController < ApplicationController
  before_filter :login_required
  # GET /provincias
  # GET /provincias.json
  def index
    @provincias = Provincia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @provincias }
    end
  end

  # GET /provincias/1
  # GET /provincias/1.json
  def show
    @provincia = Provincia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @provincia }
    end
  end

  # GET /provincias/new
  # GET /provincias/new.json
  def new
    @provincia = Provincia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @provincia }
    end
  end

  # GET /provincias/1/edit
  def edit
    @provincia = Provincia.find(params[:id])
  end

  # POST /provincias
  # POST /provincias.json
  def create
    @provincia = Provincia.new(params[:provincia])

    respond_to do |format|
      if @provincia.save
        format.html { redirect_to @provincia, :notice => 'Provincia was successfully created.' }
        format.json { render :json => @provincia, :status => :created, :location => @provincia }
      else
        format.html { render :action => "new" }
        format.json { render :json => @provincia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /provincias/1
  # PUT /provincias/1.json
  def update
    @provincia = Provincia.find(params[:id])

    respond_to do |format|
      if @provincia.update_attributes(params[:provincia])
        format.html { redirect_to @provincia, :notice => 'Provincia was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @provincia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /provincias/1
  # DELETE /provincias/1.json
  def destroy
    @provincia = Provincia.find(params[:id])
    @provincia.destroy

    respond_to do |format|
      format.html { redirect_to provincias_url }
      format.json { head :ok }
    end
  end
end
