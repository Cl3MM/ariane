class Administration::ModelsController < ApplicationController
  before_filter :authenticate_user!
  # GET /models
  # GET /models.json
  def index
    @models = Model.order(:name).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @models }
    end
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @model = Model.find(params[:id])
    @photos = @model.photos.paginate(:page => params[:page], :per_page => 10)
    @photo = Photo.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/new
  # GET /models/new.json
  def new
    @model = Model.new
#    @model.build_category
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/1/edit
  def edit
    @model = Model.find(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
#    binding.pry
#    params[:model][:category] = Category.find_by_id(params[:model][:category].to_i)
    @model = Model.new(params[:model])
    respond_to do |format|
      if @model.save
        format.html { redirect_to [:administration, @model], notice: 'Model was successfully created.' }
        format.json { render json: @model, status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /models/1
  # PUT /models/1.json
  def update
    @model = Model.find(params[:id])
    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to [:administration, @model], notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to administration_models_url }
      format.json { head :no_content }
    end
  end
end
