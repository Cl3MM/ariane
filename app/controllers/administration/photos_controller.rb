class Administration::PhotosController < ApplicationController
  # GET /administration/photos
  # GET /administration/photos.json
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /administration/photos/1
  # GET /administration/photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /administration/photos/new
  # GET /administration/photos/new.json
  def new
    @photo = Photo.new
    @model = Model.find_by_id(params[:model_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /administration/photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /administration/photos
  # POST /administration/photos.json
  def create
    @photo = Photo.new(params[:photo])
    if @photo.image_file_size.nil?
      flash[:error] = t(:photo_create_no_file)
    end
    @model = Model.find_by_id(@photo.model_id)
    if @photo.save
      flash[:notice] = t(:photo_create_success)
    else
      flash[:error] = t(:photo_create_not_saved)
    end
    respond_to do |format|
      if flash[:error]
        format.html { redirect_to [:administration, @model] }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { redirect_to [:administration, @model] }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/photos/1
  # PUT /administration/photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: t(:photo_update_success) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/photos/1
  # DELETE /administration/photos/1.json
  def batch_destroy
    @model = Model.find_by_id(params[:model_id])
    if params[:photos].blank?
      flash[:error] = t(:administration_photos_batch_destroy_no_photos)
    else
      photos = params[:photos]
      names = []
      photos.each do |photo_id|
        photo = Photo.find_by_id(photo_id)
        names << photo.image_file_name.titleize
        photo.destroy
      end
      flash[:success] = "#{t(:administration_photos_batch_destroy_success)}: #{names.join(' ')}"
    end
    respond_to do |format|
      format.html { redirect_to administration_model_path(@model) }
      format.json { head :no_content }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
