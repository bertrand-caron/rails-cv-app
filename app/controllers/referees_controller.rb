class RefereesController < ApplicationController
  add_breadcrumb 'Referees', :referees_path
  before_action :set_referee, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:show, :index, :edit, :update, :new, :create, :destroy]
  before_action :set_files_hash, only: [:new, :edit]

  # GET /referees
  # GET /referees.json
  def index
    @set_title = true
    @referees = Referee.all
  end

  # GET /referees/1
  # GET /referees/1.json
  def show
  end

  # GET /referees/new
  def new
    @referee = Referee.new
    @referee.rank = Referee.count + 1
    add_breadcrumb 'New', new_referee_path
  end

  # GET /referees/1/edit
  def edit
    add_breadcrumb 'Edit', edit_referee_path
  end

  # POST /referees
  # POST /referees.json
  def create
    @referee = Referee.new(referee_params)

    respond_to do |format|
      if @referee.save
        format.html { redirect_to referees_path, notice: 'Referee was successfully created.' }
        format.json { render :show, status: :created, location: @referee }
      else
        format.html { render :new }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referees/1
  # PATCH/PUT /referees/1.json
  def update
    respond_to do |format|
      if @referee.update(referee_params)
        format.html { redirect_to referees_path, notice: 'Referee was successfully updated.' }
        format.json { render :show, status: :ok, location: @referee }
      else
        format.html { render :edit }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referees/1
  # DELETE /referees/1.json
  def destroy
    @referee.destroy
    respond_to do |format|
      format.html { redirect_to referees_url, notice: 'Referee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_referee
    @referee = Referee.find(params[:id])
    add_breadcrumb @referee.name, @referee
  end

  def set_files_hash
    @files_hash = { None: 0 }.merge(Hash[UploadedFile.all.map(&:name).zip(UploadedFile.all.map(&:id))])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def referee_params
    params.require(:referee).permit(:name, :email, :title, :personal_page, :gender, :rank, :thumbnail_img, :uploaded_file_id)
  end
end
