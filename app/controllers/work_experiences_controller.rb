class WorkExperiencesController < ApplicationController
  add_breadcrumb 'Work Experiences', :work_experiences_path
  before_action :set_work_experience, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:show, :index, :edit, :update, :new, :create, :destroy]
  before_action :set_referee_hash, only: [:new, :edit]

  # GET /work_experiences
  # GET /work_experiences.json
  def index
    @set_title = true
    @work_experiences = WorkExperience.all
  end

  # GET /work_experiences/1
  # GET /work_experiences/1.json
  def show
  end

  # GET /work_experiences/new
  def new
    @work_experience = WorkExperience.new
    @work_experience.rank = WorkExperience.count + 1
    add_breadcrumb 'New', new_work_experience_path
  end

  # GET /work_experiences/1/edit
  def edit
    add_breadcrumb 'Edit', edit_work_experience_path
  end

  # POST /work_experiences
  # POST /work_experiences.json
  def create
    @work_experience = WorkExperience.new(work_experience_params)

    respond_to do |format|
      if @work_experience.save
        format.html { redirect_to work_experiences_path, notice: 'Internship was successfully created.' }
        format.json { render :show, status: :created, location: @work_experience }
      else
        format.html { render :new }
        format.json { render json: @work_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_experiences/1
  # PATCH/PUT /work_experiences/1.json
  def update
    respond_to do |format|
      if @work_experience.update(work_experience_params)
        format.html { redirect_to work_experiences_path, notice: 'Internship was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_experience }
      else
        format.html { render :edit }
        format.json { render json: @work_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_experiences/1
  # DELETE /work_experiences/1.json
  def destroy
    @work_experience.destroy
    respond_to do |format|
      format.html { redirect_to work_experiences_url, notice: 'Internship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work_experience
    # First, look for the work_experience with the matching id
    begin
      @work_experience = WorkExperience.find params[:id]
    rescue ActiveRecord::RecordNotFound
      # If such an work_experience can't be found, look for an work_experience whos hyperlink matches the id
      @work_experience = WorkExperience.find_by hyperlink: params[:id]
      unless @work_experience
        # If the answer of the find_by request is nil, just dump everything and go back to the root
        redirect_to '/'
      end
    end
    add_breadcrumb @work_experience.title, @work_experience
  end

  def set_referee_hash
    @referee_hash = { None: 0 }.merge(Hash[Referee.all.map(&:name).zip(Referee.all.map(&:id))])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_experience_params
    params.require(:work_experience).permit(:title, :hyperlink, :description, :report_path, :location, :laboratory, :duration, :rank, :referee_id)
  end
end
