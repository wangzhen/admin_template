class Admin::AdministratorsController < Admin::BaseController
  def index
    @administrators = Administrator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @administrators }
    end
  end

  # GET /administrators/1
  # GET /administrators/1.xml
  def show
    @administrator = Administrator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administrator }
    end
  end

  # GET /administrators/new
  # GET /administrators/new.xml
  def new
    @administrator = Administrator.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administrator }
    end
  end

  # GET /administrators/1/edit
  def edit
    @administrator = Administrator.find(params[:id])
  end

  # POST /administrators
  # POST /administrators.xml
  def create
    @administrator = Administrator.new(params[:administrator])

    if @administrator.save
      flash[:notice] = 'Administrator was successfully created.'
      redirect_to admin_administrators_path
    else
      render :action => "new"
    end
  end

  # PUT /administrators/1
  # PUT /administrators/1.xml
  def update
    @administrator = Administrator.find(params[:id])

    if @administrator.update_attributes(params[:administrator])
      flash[:notice] = 'Administrator was successfully updated.'
      redirect_to admin_administrators_path
    else
      render :action => "edit"
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.xml
  def destroy
    @administrator = Administrator.find(params[:id])
    @administrator.destroy

    respond_to do |format|
      format.html { redirect_to(administrators_url) }
      format.xml  { head :ok }
    end
  end
end
