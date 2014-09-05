class UploadedFilesController < ApplicationController
  before_action :set_uploaded_file, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

  # GET /uploaded_files
  # GET /uploaded_files.json
  def index
    @uploaded_files = UploadedFile.all
  end

  # GET /uploaded_files/1
  # GET /uploaded_files/1.json
  def show
  end

  # GET /uploaded_files/new
  def new
    @uploaded_file = UploadedFile.new
  end

  # GET /uploaded_files/1/edit
  def edit
  end

  # POST /uploaded_files
  # POST /uploaded_files.json
  def create
    @uploaded_file = UploadedFile.new(uploaded_file_params)

    uploaded_io = params[:uploaded_file][:content]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @uploaded_file.name = uploaded_io.original_filename

    respond_to do |format|
      if @uploaded_file.save
        format.html { redirect_to @uploaded_file, notice: 'Uploaded file was successfully created.' }
        format.json { render :show, status: :created, location: @uploaded_file }
      else
        format.html { render :new }
        format.json { render json: @uploaded_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploaded_files/1
  # PATCH/PUT /uploaded_files/1.json
  def update
    respond_to do |format|
      if @uploaded_file.update(uploaded_file_params)
        format.html { redirect_to @uploaded_file, notice: 'Uploaded file was successfully updated.' }
        format.json { render :show, status: :ok, location: @uploaded_file }
      else
        format.html { render :edit }
        format.json { render json: @uploaded_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploaded_files/1
  # DELETE /uploaded_files/1.json
  def destroy
    path_to_file = Rails.root.join('public', 'uploads', @uploaded_file.name)
    File.delete(path_to_file) if File.exist?(path_to_file)
    @uploaded_file.destroy
    respond_to do |format|
      format.html { redirect_to uploaded_files_url, notice: 'Uploaded file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uploaded_file
      @uploaded_file = UploadedFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uploaded_file_params
      params.require(:uploaded_file).permit(:name)
    end
end
