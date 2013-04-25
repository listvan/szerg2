class UploadsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @uploads = @user.uploads

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  def show
    @upload = Upload.find(params[:id])
    redirect_to URI.escape(@upload.file.url)
  end

  def new
    @upload = User.find(params[:user_id]).uploads.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  def create
    @user   = User.find(params[:user_id])
    @upload = @user.uploads.new(params[:upload])

    respond_to do |format|
      if @upload.save
        format.html { redirect_to user_uploads_path(@user), notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user   = User.find(params[:user_id])
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to user_uploads_url(@user) }
      format.json { head :no_content }
    end
  end
end
