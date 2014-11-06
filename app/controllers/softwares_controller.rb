class SoftwaresController < ApplicationController
  add_breadcrumb "Softwares", :softwares_path
  before_action :set_software, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:show, :edit, :update, :new, :create, :destroy]

  # GET /softwares
  # GET /softwares.json
  def index
    @set_title = true
    @softwares = Software.all
  end

  # GET /softwares/1
  # GET /softwares/1.json
  def show
  end

  # GET /softwares/new
  def new
    @software = Software.new
    add_breadcrumb "New", new_software_path
  end

  # GET /softwares/1/edit
  def edit
    add_breadcrumb "Edit", edit_software_path
  end

  # POST /softwares
  # POST /softwares.json
  def create
    @software = Software.new(software_params)

    respond_to do |format|
      if @software.save
        format.html { redirect_to @software, notice: 'Software was successfully created.' }
        format.json { render :show, status: :created, location: @software }
      else
        format.html { render :new }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /softwares/1
  # PATCH/PUT /softwares/1.json
  def update
    respond_to do |format|
      if @software.update(software_params)
        format.html { redirect_to @software, notice: 'Software was successfully updated.' }
        format.json { render :show, status: :ok, location: @software }
      else
        format.html { render :edit }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /softwares/1
  # DELETE /softwares/1.json
  def destroy
    @software.destroy
    respond_to do |format|
      format.html { redirect_to softwares_url, notice: 'Software was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      begin
        @software = Software.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        # If such a record can't be found, look for a record whos hyperlink matches the id
        @software = Software.find_by hyperlink: params[:id]
        if not @software
          # If the answer of the find_by request is nil, just dump everything and go back to the root
          redirect_to '/'
        end
      end
      add_breadcrumb @software.name, @software
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def software_params
      params.require(:software).permit(:name, :github_link, :description, :hyperlink)
    end
end
