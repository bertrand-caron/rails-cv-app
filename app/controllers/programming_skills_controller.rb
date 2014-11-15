class ProgrammingSkillsController < ApplicationController
  add_breadcrumb 'Programming Skills', :programming_skills_path
  before_action :set_programming_skill, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:show, :index, :edit, :update, :new, :create, :destroy]

  # GET /programming_skills
  # GET /programming_skills.json
  def index
    @set_title = true
    @programming_skills = ProgrammingSkill.all
  end

  # GET /programming_skills/1
  # GET /programming_skills/1.json
  def show
  end

  # GET /programming_skills/new
  def new
    @programming_skill = ProgrammingSkill.new
    @programming_skill.rank = ProgrammingSkill.count + 1
    @programming_skill.ranking = 3
    add_breadcrumb 'New', new_programming_skill_path
  end

  # GET /programming_skills/1/edit
  def edit
    add_breadcrumb 'Edit', edit_programming_skill_path
  end

  # POST /programming_skills
  # POST /programming_skills.json
  def create
    @programming_skill = ProgrammingSkill.new(programming_skill_params)

    respond_to do |format|
      if @programming_skill.save
        format.html { redirect_to programming_skills_path, notice: 'Programming skill was successfully created.' }
        format.json { render :show, status: :created, location: @programming_skill }
      else
        format.html { render :new }
        format.json { render json: @programming_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programming_skills/1
  # PATCH/PUT /programming_skills/1.json
  def update
    respond_to do |format|
      if @programming_skill.update(programming_skill_params)
        format.html { redirect_to programming_skills_path, notice: 'Programming skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @programming_skill }
      else
        format.html { render :edit }
        format.json { render json: @programming_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programming_skills/1
  # DELETE /programming_skills/1.json
  def destroy
    @programming_skill.destroy
    respond_to do |format|
      format.html { redirect_to programming_skills_url, notice: 'Programming skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_programming_skill
    begin
      @programming_skill = ProgrammingSkill.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # If such an model can't be found, look for an model whos hyperlink matches the id
      @programming_skill = ProgrammingSkill.find_by hyperlink: params[:id]
      unless @programming_skill
        # If the answer of the find_by request is nil, just dump everything and go back to the root
        redirect_to '/'
      end
    end
    add_breadcrumb @programming_skill.title, @programming_skill
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def programming_skill_params
    params.require(:programming_skill).permit(:title, :skill_type, :description, :details, :hyperlink, :rank, :ranking, :icon)
  end
end
